class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @record = Record.new
    redirect_to root_path if current_user.id == @item.user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @record = Record.new(record_params)
    if @record.valid?
      pay_item
      @record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:record).permit(:time).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_0f8309f57450f76854fd1ebb"
    Payjp::Charge.create(
      amount: @record.item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

end

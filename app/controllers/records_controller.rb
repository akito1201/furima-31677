class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @user_record = UserRecord.new
    redirect_to root_path if current_user.id == @item.user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @user_record = UserRecord.new(user_record_params)

    if @user_record.valid?
      pay_item
      @user_record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_record_params
    params.require(:user_record).permit(:zipcode, :region_id, :city, :house, :building, :telephone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_0f8309f57450f76854fd1ebb"
    Payjp::Charge.create(
      amount: @item.price,
      card: user_record_params[:token],
      currency: 'jpy'
    )
  end

end

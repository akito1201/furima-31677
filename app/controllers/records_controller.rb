class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out, only: :index

  def index
    set_item
    @user_record = UserRecord.new
    redirect_to root_path if current_user.id == @item.user.id
  end

  def create
    set_item
    @user_record = UserRecord.new(user_record_params)
    if @user_record.valid?
      pay_item
      @user_record.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_record_params
    params.require(:user_record).permit(:zipcode, :region_id, :city, :house, :building, :telephone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_record_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.record.nil?
  end
end

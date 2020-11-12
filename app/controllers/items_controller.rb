class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_parameter
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_id, :region_id, :delivery_id, :price).merge(user_id: current_user.id)
  end
end

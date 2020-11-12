class ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_paramter)
    if @item.save
      redirect_to ：root_path
    else
      render :new
    end
  end

  private

  def item_paramter
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_id, :region_id, :days_id, :price).merge(user_id: current_user.id)
  end
end

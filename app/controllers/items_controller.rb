class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :seller_check, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
    @favorites = Favorite.find_by(user_id: current_user.id)
  end

  def owner
    @items = Item.where(user_id: current_user.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @favorite = Favorite.find_by(item_id: @item.id, user_id: current_user.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    keyword = params[:keyword]
    if keyword.present?
    @items = Item.search(params[:keyword])
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_id, :region_id, :delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def seller_check
    redirect_to root_path unless current_user.id == @item.user.id
  end


end

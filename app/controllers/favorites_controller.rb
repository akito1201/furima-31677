class FavoritesController < ApplicationController
  def check
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    if favorite.present?
      if favorite.checked?
        favorite.update(checked: false)
      else
        favorite.update(checked: true)
      end
    else
      Favorite.create(user_id: current_user.id, item_id: params[:item_id], checked: true)
    end
    item = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    render json: { post: item }
  end

  def index
    @favorites = Favorite.where(user_id: params[:user_id], checked: true).includes(:item)
  end
end

class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
      @favorite = Favorite.create(user_id: current_user.id, micropost_id: params[:micropost_id])
    end

    def destroy
      favorite = Favorite.find_by(user_id: current_user.id, micropost_id: params[:micropost_id])
      favorite.destroy
    end
end


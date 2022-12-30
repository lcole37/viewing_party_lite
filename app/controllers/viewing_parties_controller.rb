class ViewingPartiesController < ApplicationController
  def new
    if session[:user_id]
      @user = User.find(params[:user_id])
    else
      redirect_to user_movie_path(params[:user_id], params[:movie_id])
      flash[:error] = "You must be logged in"
    end
  end
end

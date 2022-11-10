class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    user = Author.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

class MainController < ApplicationController
  def login
  end

  def create
    u=User.where(email:params[:email]).first
    if u && u.authenticate(params[:password])
      redirect_to main_create_path
      session[:logged_in] =true
      session[:id]= u.id
      session[:type]=u.user_type
    else
      redirect_to '/login', notice: 'wrong login info'
    end
  end
end

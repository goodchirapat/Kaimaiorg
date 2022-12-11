class MainController < ApplicationController
  def login
  end

  def create
    u=User.where(email:params[:email]).first
    if u && u.authenticate(params[:password])
      redirect_to '/main'
      session[:logged_in] =true
      session[:id]= u.id
      session[:type]=u.user_type
    else
      redirect_to '/login', notice: "wrong login"
    end
  end

  def menu
  end

  def profile
    @u=User.where(id:session[:id]).first
    @name= @u.name
    @email= @u.email
    if session[:type]==0 
      @type="admin"
    elsif session[:type]==1  
      @type="buyer"
    else 
      @type="seller"
    end
  end

  def change_password
    @u=User.where(id:session[:id]).first
    if @u.authenticate(params[:old_password])
      @u.password=params[:new_password]
      redirect_to '/profile', notice: "password change success!"
    else
      redirect_to '/profile', notice: "failed to change password"
    end
  end

  def my_market
  end

  def purchase_history
  end

  def sale_history
  end

  def my_inventory
  end

  def top_seller
  end
end

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
      @u.password= params[:new_password]
      @u.save
      redirect_to '/profile', notice: "password change success!"
    else
      redirect_to '/profile', notice: "failed to change password"
    end
  end

  def my_market
    @user=User.where(id:session[:id]).first
  end

  def purchase_history
    @user=User.where(id:session[:id]).first
    @inventory= @user.bought_items
  end

  def sale_history
    @user=User.where(id:session[:id]).first
    @inventory= @user.sold_items
  end

  def my_inventory
    @user=User.where(id:session[:id]).first
  end

  def top_seller_filter
  end

  def top_seller
    @r=Inventory.where(created_at: Date.parse(params[:start])..Date.parse(params[:stop]))
    @inventory=@r.group(:seller_id).sum(:qty)
    @inventory2=@r.group(:seller_id).sum(:price)

  end

  def buy_qty
    @market=Market.where(id:params[:mid]).first
    @seller=User.where(id:@market.user_id).first
    @i=Item.where(id:@market.item_id).first
  end

  def buy
    @market=Market.where(id:params[:mid]).first
    if @market.stock-params[:qty].to_i <0
      redirect_to '/my_market' , notice: "Not enough stock!"
    else
      @market.stock=@market.stock-params[:qty].to_i
      @market.save
      inv=Inventory.new()
      inv.buyer_id=session[:id].to_i
      inv.seller_id=@market.user_id
      inv.item_id=@market.item_id
      inv.price=@market.price
      inv.qty=params[:qty]
      inv.save
      redirect_to '/my_market' , notice: "Bought!"
    end

  end

end

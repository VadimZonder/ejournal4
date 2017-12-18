class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def help
  end

  def about
  end
  
  def category
    st = params[:title]
    @items = Item.where("category like ?" , st)
  end
  
  
  def orderConfirmed
    
    
    
  end
  
  
  def paid
    # Here you could also cear the cart
    
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    session[:cart] = nil
  end  
  
end

class UserController < ApplicationController
    def login
    end
    
    def admin_login
        session[:login] = 1
        session[:cart] = nil
        flash[:notice] = "You are in Admin Mode!"
        redirect_to :controller => :items
    end 
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "Logout was successful!!"
        redirect_to :controller => :items
    end    
    
end

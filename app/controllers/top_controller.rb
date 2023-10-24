require 'bcrypt'

class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error"
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
  
  def new
    render "make"
  end
  
  def make
    make_pass = BCrypt::Password.create(params[:pass])
    user = User.new(uid: params[:uid], pass: make_pass)
    user.save
    session[:login_uid] = params[:uid]
    redirect_to top_main_path
  end
end
    
    
    
    #logger.debug params[:pass]
    #logger.debug params[:uid]
    
    #if User.find_by(uid: params[:uid]) and BCrypt::Password.new(user.pass) == params[:pass]
      #session[:login_uid] = params[:uid]
      #redirect_to top_main_path
    #else
      #logger.debug("***")
      #render "error"
    #end
  #end
  
  #def logout
    #session.delete(:login_uid)
    #redirect_to top_main_path
  #end
#end
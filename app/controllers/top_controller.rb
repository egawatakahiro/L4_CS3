class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    logger.debug params[:uid]
    if User.find_by(uid: params[:uid]) and User.find_by(pass: params[:pass])
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      logger.debug("***")
      render "error"
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
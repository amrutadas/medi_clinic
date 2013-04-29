class UsersController < ApplicationController
   before_filter :authenticate_user!
   
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy if session[:_csrf_token] == params[request_forgery_protection_token]

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end

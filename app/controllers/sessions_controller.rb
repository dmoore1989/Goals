class SessionsController < ApplicationController
  before_action :redirect_on_login, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by_credentials( params[:user][:username],
                                      params[:user][:password])
    if @user.nil?
      render :new
    else
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    logout!
    render :new
  end
end

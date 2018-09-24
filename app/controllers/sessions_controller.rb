class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: params[:user][:email]
    if @user.nil?
      redirect_to users_sign_in_path, alert: 'User incorrect.'
    else
      if @user.password == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Session logged'
      else
        redirect_to users_sign_in_path, alert: 'Password incorrect.'
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require('user').permit(%I[email password])
  end
end

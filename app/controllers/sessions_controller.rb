class SessionsController < ApplicationController
  def create
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @users = User.all
    if current_user.id != (params[:id]).to_i
      @users.find(params[:id]).destroy
    else
      flash.alert = "You cannot delete your own account from here, contact admin"
    end
    redirect_to dashboard_path
  end
end

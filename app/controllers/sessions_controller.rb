class SessionsController < ApplicationController
  def create
    if @user = User.find_by(name:params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:notice] = "Authenticated!"

        redirect_to user_path(@user)
      else
        flash[:notice] = "You made a typo"
        redirect_to "/"
      end
    else
      flash[:notice] = "Who Dat?"
      redirect_to "/"
    end
  end
end

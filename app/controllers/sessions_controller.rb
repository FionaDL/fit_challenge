class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  @user = User.find_by(name: params[:session][:name])
  if @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    @message = "Please make sure your username and password are correct."
    render 'new'
  end
end

  def destroy
   session.delete :user_id
   redirect_to '/'
  end


end

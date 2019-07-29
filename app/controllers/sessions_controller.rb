class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_by(:uid => auth['uid'])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.create(:uid => auth['uid']) do |user|
          user.name = auth['info']['name']
          user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=6)
      end
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
      end
     else
       @user = User.find_by(name: params[:user][:name])
         if @user && @user.authenticate(params[:user][:password])
             session[:user_id] = @user.id
             redirect_to user_path(@user)
         else
           @message = @user.errors
           render 'new'
         end
      end
   end

  def destroy
   session.delete :user_id
   redirect_to '/'
  end

   private

   def auth
     request.env['omniauth.auth']
   end


end

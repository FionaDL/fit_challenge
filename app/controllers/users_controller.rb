class UsersController < ApplicationController

 def new
   @user = User.new
 end

 def create
   @user = User.create(user_params)
   if @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       @message = "Please enter all information to create a user."
       render 'new'
     end
 end

 def show
   @user = User.find_by(id: params[:id])
   if !@user.challenges.empty?
     @challenges = @user.challenges
     @current_challenges = @user.current_challenges(@challenges)
     @expired_challenges = @user.expired_challenges(@challenges)
   end
 end

 private

    def user_params
      params.require(:user).permit(:name, :password, :height, :weight, :quote)
    end


end

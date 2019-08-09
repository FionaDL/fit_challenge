class UsersController < ApplicationController

  def index
    @users = User.all
    render :json => {:users => @users}
  end

 def new
   @user = User.new
 end

 def create
   @user = User.create(user_params)
   if @user.save
       session[:user_id] = @user.id
       respond_to do |f|
         f.html {render :show}
         f.json {render json: @user}
       end
     else
       render 'new'
   end
 end

 def edit
    @user = User.find_by(id: params[:id])
 end

 def update
   @user = User.find_by(id: params[:user][:user_id])
   @user.update(weight: params[:user][:weight], height: params[:user][:height], quote: params[:user][:quote])
   if @user.save
     redirect_to user_path(@user)
   else
     render 'edit'
   end
 end

 def show
   @user = User.find_by(id: params[:id])
   if !@user.challenges.empty?
     @current_challenges = @user.challenges.current_challenges
     @expired_challenges = @user.challenges.expired_challenges
     @completed_challenges = @user.challenges.completed_challenges
   end
   respond_to do |f|
     f.html {render :show}
     f.json {render :json => {:user => @user, :current_challenges => @current_challenges, :expired_challenges => @expired_challenges}}

   end
 end

 private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :height, :weight, :quote)
    end


end

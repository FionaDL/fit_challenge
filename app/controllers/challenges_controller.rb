class ChallengesController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params)
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      @message = "Please fillout all information to create a challege."
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :start_date, :end_date, :prize, :notes, :workout_amount, :user_id)
  end

end

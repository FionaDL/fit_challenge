class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new(user_id: params[:user_id])

  end

  def create
    @challenge = Challenge.create(challenge_params)
    if @challenge.save
      redirect_to user_challenge_path(@challenge.user_id, @challenge)
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

class ChallengesController < ApplicationController

  def new
    @user = current_user
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params)
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
    @challengeworkouts = @challenge.challengeworkouts
    @workouts = @challenge.workouts
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :start_date, :end_date, :reward, :notes, :workouts_needed, :user_id)
  end

end

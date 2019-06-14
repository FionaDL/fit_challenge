class ChallengesController < ApplicationController

  def new
    @user = current_user
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params)
    @user = @challenge.user
    if @challenge.save
      respond_to do |f|
        f.html {redirect_to challenge_path(@challenge)}
        f.json {render json: @challenge}
      end
    else
      @user = current_user
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
    @user = @challenge.user
    @challengeworkouts = @challenge.challengeworkouts
    @workouts = @challenge.workouts
    @workout = Workout.new
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @challenge}
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :start_date, :end_date, :reward, :notes, :workouts_needed, :user_id)
  end

end

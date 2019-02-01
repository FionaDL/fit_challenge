class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
    @challenge = Challenge.find_by(id: (params[:challenge_id]))
    @user_id = current_user.id
  end

  def create
    @workout = Workout.create(workout_params)
    if @workout.save
      redirect_to new_challenge_workout_path
    else
      @message = "Please fillout all information to create a workout."
      render 'new'
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:kind)
  end

end

class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
    @user = User.find_by(id: (params[:user_id]))
  end

  def create
    @workout = Workout.create(workout_params)
    if @workout.save
      redirect_to challenge_path(@workout)
    else
      @message = "Please fillout all information to create a challege."
      render 'new'
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_ids, :challenge_ids)
  end

end

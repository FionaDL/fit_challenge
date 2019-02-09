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
    @workout = Workout.create(kind: params[:workout][:kind])
    @challengeworkout = Challengeworkout.create(challenge_id: params[:challenge_id], workout_id: @workout.id )
    if @workout.save
      redirect_to edit_challengeworkout_path(@challengeworkout)
    else
      @message = "Please fillout all information to create a workout."
      render 'new'
    end
  end

  private


end

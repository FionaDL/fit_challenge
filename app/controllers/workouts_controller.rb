class WorkoutsController < ApplicationController


  def new
    @workout = Workout.new
    @challenge = Challenge.find_by(id: (params[:challenge_id]))
    @user = current_user
  end

  def create
    @workout = Workout.create(kind: params[:workout][:kind])
    if @workout.save
        @challengeworkout = Challengeworkout.create(challenge_id: params[:challenge_id], workout_id: @workout.id )
      redirect_to edit_challengeworkout_path(@challengeworkout)
    else
      render 'new'
    end
  end



end

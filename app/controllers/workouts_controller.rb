class WorkoutsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @workout = Workout.new
    @challenge = Challenge.find_by(id: (params[:challenge_id]))
    @user = current_user
  end

  def create
    @workout = Workout.create(kind: params[:workout][:kind])
    if @workout.save
      @challengeworkout = Challengeworkout.create(challenge_id: params[:workout][:challenge_id], workout_id: @workout.id )
      @challenge_id = params[:workout][:challenge_id]
        #respond_to do |f|
          #f.html {redirect_to edit_challengeworkout_path(@challengeworkout)}
          #f.json {
        render :json => {:workout => @workout, :challenge_id => @challenge_id}
        #end
    else
      render 'new'
    end
  end

  def index
    if params[:challenge_id]
      @challenge=Challenge.find_by_id(params[:challenge_id])
      @workouts = @challenge.workouts
    else
      @workouts = Workout.all
    end
  end



end

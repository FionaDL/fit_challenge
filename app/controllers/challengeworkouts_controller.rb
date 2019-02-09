 class ChallengeworkoutsController < ApplicationController

   def edit
     @challengeworkout = Challengeworkout.find_by(id: params[:id])
     @challenge_id = @challengeworkout.challenge_id
     @workout_id = @challengeworkout.workout_id
   end

   def update
     @challengeworkout = Challengeworkout.find_by(id: params[:id])
      if @challengeworkout
       @challengeworkout.update(challengeworkout_params)
        redirect_to challenge_path(@challengeworkout.challenge)
      else
        render :edit
      end
   end

 private

 def challengeworkout_params
     params.require(:challengeworkout).permit(:workout_duration, :challenge_id, :workout_id)
 end

 end

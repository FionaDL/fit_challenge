$(document).ready(() => {
  addMoreInfoListener()
})


function addMoreInfoListener() {
  $('button#more-info').one('click', (e) => {
    e.preventDefault()
    let challengeId = (e.currentTarget.dataset.id)
    getMoreInfo(challengeId)
  })

  $('#workoutform').submit(function(e) {
      e.preventDefault()
      let challengeId = (e.currentTarget.dataset.id)
      let values = $(this).serialize()
      $.post('/challenges/' + challengeId + '/workouts', values).done(function(data) {
        let newWorkout = new Workout(data)
        workoutHtml = newWorkout.formatWorkout()
        $('#workouts').append(workoutHtml)
      })
  }
)
}

function getMoreInfo(challengeId) {
  $.get("/challenges/" + challengeId + ".json", function(data) {
    appendMoreInfo(data)
  })
}

function appendMoreInfo(data) {
  let challenge = data
  let newChallenge = new FullChallenge(challenge)
  let fullChallengeHtml = newChallenge.formatFullChallenge()
  $("#more-info-challenge").append(fullChallengeHtml)
}

class FullChallenge {
  constructor(challenge) {
    this.id = challenge.id
    this.name = challenge.name
    this.start_date = challenge.start_date
    this.end_date = challenge.end_date
    this.workouts_needed = challenge.workouts_needed
    this.reward = challenge.reward
    this.notes = challenge.notes
    this.user_id = challenge.user_id
   }
  }


FullChallenge.prototype.formatFullChallenge = function(){
   return (`
     <p>Start Date: ${this.start_date}</p>
     <p>End Date: ${this.end_date}</p>
     <p>Workouts Needed: ${this.workouts_needed}</p>
     <p>Reward: ${this.reward}</p>
     <p>Notes: ${this.notes}</p>
     `)
}

class Workout {
  constructor(workout) {
    this.id = workout.workout.id
    this.kind = workout.workout.kind
  }
}

Workout.prototype.formatWorkout = function(){
  return (`
    <p>Kind: ${this.kind}</p>
    `)
}

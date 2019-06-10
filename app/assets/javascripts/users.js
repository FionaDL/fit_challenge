

$(document).ready(function() {
  eventListeners()
});

function eventListeners() {
  $('button#current-challenge-button').on('click', (e) => {
    e.preventDefault()
    let id = (e.currentTarget.dataset.id)
    getCurrentChallenges(id)
  })

  $('button#expired-challenge-button').on('click', (e) => {
    e.preventDefault()
    let id = (e.currentTarget.dataset.id)
    getExpiredChallenges(id)
  })

}

function getCurrentChallenges(id) {
  $.get("/users/" + id + ".json", function(data) {
    appendCurrentChallenges(data)
  })
}

function appendCurrentChallenges(data) {
  let challengeArray = data.current_challenges
  console.log(challengeArray)
  if (challengeArray == null) {
    $("#challengeName").append("No Current Challenges Exist.")
  }
  else {
  challengeArray.forEach(challenge => {
    let newChallenge = new Challenge(challenge)
    let challengeHtml = newChallenge.formatChallenge()
    $("#current-challenges").append(challengeHtml)
    })
  }
}


function getExpiredChallenges(id) {
  $.get("/users/" + id + ".json", function(data) {
    console.log(data)
  })
}

function appendMoreInfo(data) {
  let challenge = data
  let newChallenge = new Challenge(challenge)
  let fullChallengeHtml = newChallenge.formatFullChallenge()
  $("#more-info-challenge").html(" ")
}


class Challenge {
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

  Challenge.prototype.formatChallenge = function(){

     return (`
       <ul>
       <li><a href= http://localhost:3000/challenges/${this.id}>${this.name}<a></li>
       </ul>
       `)
  }


    Challenge.prototype.formatFullChallenge = function(){
       return (`
         <p>Start Date: ${this.start_date}</p>
         <p>End Date: ${this.end_date}</p>
         <p>Workouts Needed: ${this.workouts_needed}</p>
         <p>Reward: ${this.reward}</p>
         <p>Notes: ${this.notes}</p>
         `)
    }

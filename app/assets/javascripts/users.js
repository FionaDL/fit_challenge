

$(document).ready(() => {
  eventListeners()
})

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
  if (!challengeArray) {
    $("#current-challenges").html("<p>No Current Challenges Exist.</p>")
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
    appendExpiredChallenges(data)
  })
}

function appendExpiredChallenges(data) {
  let challengeArray = data.expired_challenges
  console.log(challengeArray)
  if (!challengeArray) {
    $("#expired-challenges").html("<p>No Expired Challenges Exist.</p>")
  }
  else {
  challengeArray.forEach(challenge => {
    let newChallenge = new Challenge(challenge)
    let challengeHtml = newChallenge.formatChallenge()
    $("#expired-challenges").append(challengeHtml)
    })
  }
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

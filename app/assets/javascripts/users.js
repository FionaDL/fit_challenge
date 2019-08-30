

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

  $('button#all_users').on('click', (e) => {
    getUsers()
  })

}

function getUsers() {
  $.get("/users.json", function(data) {
    appendUsers(data)
  })
}


function appendUsers(data) {
  let users = data.users
  let eachUser = users.map((user) => {
     return (`
       <li><a data-name="${user.name}" href= http://localhost:3000/users/${user.id}>${user.name}<a></li>        `
)
   })
   $(".show_users").append(eachUser.sort())
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
       <ul id="lists">
       <li><a href= http://localhost:3000/challenges/${this.id}>${this.name}<a></li>
       </ul>
       `)
  }

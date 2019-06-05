

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
    console.log(data)
  })
}

function getExpiredChallenges(id) {
  $.get("/users/" + id + ".json", function(data) {
    console.log(data)
  })
}






class User {
  constructor(user) {
    this.id = user.id
    this.weight = user.weight
    this.height = user.height
    this.quote = user.quote
  }
}

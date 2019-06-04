

$(document).ready(function() {
  eventListeners()
});

function eventListeners() {
  $('button#current-challenge-button').on('click', () => {

    let id = $(this).data("id")
    getCurrentChallenges(id)
  })

  $('button#expired-challenge-button').on('click', () => {

    let id = $(this).data("id")
    getCurrentChallenges(id)
  })

}

function getCurrentChallenges(id) {
  $.get("/users/" + 66 + ".json", function(data) {
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

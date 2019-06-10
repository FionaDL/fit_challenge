$(document).ready(function() {
  addMoreInfoListener()
});


function addMoreInfoListener() {
  $('button.more-info').on('click', (e) => {
    e.preventDefault()
    let challengeId = (e.currentTarget.dataset.id)
    getMoreInfo(challengeId)
  })
}

function getMoreInfo(challengeId) {
  $.get("/challenges/" + challengeId + ".json", function(data) {
    appendMoreInfo(data)
  })
}

function appendMoreInfo(data) {
  let challenge = data
  let newChallenge = new Challenge(challenge)
  let fullChallengeHtml = newChallenge.formatFullChallenge()
  $("#more-info-challenge").append(fullChallengeHtml)
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

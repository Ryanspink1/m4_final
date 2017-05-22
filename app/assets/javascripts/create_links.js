function findFormValues(){
  var url  = $('#create-link-url').val()
  var title = $('#create-link-title').val()
  var userID = $('#create-link-user-id').val()

  createLink(url, title, userID)
}

function createLink(url, title, userID){
  var linkParams = {url: url, title: title, user:userID}

  $.ajax({
    url: "http://localhost:3000/api/v1/links",
    type: 'post',
    data: linkParams,
  }).then(location.reload())
    .catch(function(error){
    console.error(error)
  })
}

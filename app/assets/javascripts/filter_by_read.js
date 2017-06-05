

function filterByRead(boolean){
  clearTable()
  var userID = $('#create-link-user-id').val()
  $.ajax({
    url: `http://localhost:3000/api/v1/linksreadstatus?id=${userID}&read=${boolean}`,
    type: 'get'
  }).done(appendLinkTable)
}

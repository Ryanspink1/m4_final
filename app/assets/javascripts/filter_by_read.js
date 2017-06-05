

function filterByRead(boolean){
  clearTable()
  var userID = $('#create-link-user-id').val()
  $.ajax({
    url: `https://urllockboxfinal.herokuapp.com/api/v1/linksreadstatus?id=${userID}&read=${boolean}`,
    type: 'get'
  }).done(appendLinkTable)
}

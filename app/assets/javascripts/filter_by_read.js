

function filterByRead(boolean){
  clearTable()
  $.ajax({
    url: `http://localhost:3000//api/v1/linksreadstatus?read=${boolean}`,
    type: 'get'
  }).done(appendLinkTable)
}

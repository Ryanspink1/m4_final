

function filterByRead(boolean){
  clearTable()
  $.ajax({
    url: `https://urllockboxfinal.herokuapp.com//api/v1/linksreadstatus?read=${boolean}`,
    type: 'get'
  }).done(appendLinkTable)
}

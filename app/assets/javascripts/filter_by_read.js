

function filterByRead(boolean){
  clearTable()
  var userID = $('#create-link-user-id').val()
  $.ajax({
    url: `http://localhost:3000/api/v1/linksreadstatus?id=${userID}&read=${boolean}`,
    type: 'get'
  }).done(appendLinkTable)
}
//     getLinkIndex()
//     setTimeout(filterByReadData, 1000)
//   // var linkTableData = $('.link-table-data')
//   //   for(i=0;i<linkTableData.length;i++){
//   //     if(linkTableData[i].children[2].innerHTML == boolean.toString()){}
//   //     else{
//   //       linkTableData[i].closest('tr').style.display = "none"
//   //     }
//   //   }
// }


function filterByReadData(boolean){
  var linkTableData = $('.link-table-data')
    for(i=0;i<linkTableData.length;i++){
      if(linkTableData[i].children[2].innerHTML == boolean.toString()){}
      else{
        linkTableData[i].closest('tr').style.display = "none"
      }
    }
}

// function refreshLinkTable(){
//   var linkTableData = $('.link-table-data')
//     for(i=0;i<linkTableData.length;i++){
//         linkTableData[i].closest('tr').style.display = ""
//     }
// }

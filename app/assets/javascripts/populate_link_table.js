// $(document).ready(function(){
//   if(window.location.pathname.substr(1,10) == "links"){
//     getLinkIndex()
//   };
// })
//
// function clearTable(){
//   var tableData = $('.link-table-data')
//   for(i=0;i<tableData.length;i++){
//     tableData[i].innerHTML = ""
//   }
// }
//
// function appendLinkTable(data){
//   for(i=0;i<data.length;i++){
//   $('#links-table').append(
//     `<tr class="link-table-data">
//        <th class="table-url">${data[i].url}</th>
//        <th class="table-title">${data[i].title}</th>
//        <th class="table-read">${data[i].read}</th>
//        <th>
//        <button type="button" class="btn btn-default" id="mark-read">Mark Read</button>
//        <button type="button" class="btn btn-default" id="mark-unread">Mark Unread</button>
//        </th>
//     `
//   )
//   }
// }
//
// function getLinkIndex(){
//   clearTable()
//   debugger;
//   var userID = $('#create-link-user-id').val()
//   $.ajax({
//     url: `http://localhost:3000/api/v1/links?id=${userID}`,
//     type: 'get'
//   }).done(appendLinkTable)
// }

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
  }).done(setTimeout(getLinkIndex, 500))
  //   .catch(function(error){
  //   console.error(error)
  // })
}











$(document).ready(function(){
  if(window.location.pathname.substr(1,10) == "links"){
    getLinkIndex()
  }
  else if(window.location.pathname =="/"){
    getLinkIndex()
  }
})

function clearTable(){
  var tableData = $('.link-table-data')
  for(i=0;i<tableData.length;i++){
    tableData[i].innerHTML = ""
  }
}

function clearInput(){
  $('#create-link-url')[0].value = ""
  $('#create-link-title')[0].value = ""
}

function appendLinkTable(data){
  for(i=0;i<data.length;i++){
    if(data[i].read.toString() == "false"){
      $('#links-table').append(
        `<tr class="link-table-data">
           <th class="table-url">${data[i].url}</th>
           <th class="table-title">${data[i].title}</th>
           <th class="table-read">${data[i].read}</th>
           <th>
           <button type="button" class="btn btn-default" id="mark-read">Mark Read</button>
           </th>
        `
      )
    }
   else{
     $('#links-table').append(
       `<tr class="link-table-data">
          <th class="table-url">${data[i].url}</th>
          <th class="table-title">${data[i].title}</th>
          <th class="table-read">${data[i].read}</th>
          <th>
          <button type="button" class="btn btn-default" id="mark-unread">Mark Unread</button>
          </th>
       `
     )
   }
  }
}

function getLinkIndex(){
  clearTable()
  clearInput()
  var userID = $('#create-link-user-id').val()
  $.ajax({
    url: `http://localhost:3000/api/v1/links?id=${userID}`,
    type: 'get'
  }).done(appendLinkTable)
}

function findFormValues(){
  url  = $('#create-link-url').val()
  title = $('#create-link-title').val()
  userID = $('#create-link-user-id').val()

  createLink(url, title, userID)
}

function createLink(url, title, userID){
  linkParams = {url: url, title: title, user:userID}

  $.ajax({
    url: "http://localhost:3000/api/v1/links",
    type: 'post',
    data: linkParams,
  }).then(setTimeout(getLinkIndex, 500)).fail(error)
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
  tableData = $('.link-table-data')
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
           <th><button type="button" class="btn btn-default" id="mark-read" onClick="editReadStatus(this, true)">Mark Read</button></th>
           <th><form action="http://localhost:3000/links/${data[i].id}/edit"><input type="submit" value="Edit"/></form></th>
           <th style="display:none" class="table-link-id">${data[i].id}</th>
        `
      )
    }
   else{
     $('#links-table').append(
       `<tr style="background-color:red" class="link-table-data">
          <th class="table-url">${data[i].url}</th>
          <th class="table-title">${data[i].title}</th>
          <th class="table-read">${data[i].read}</th>
          <th><button type="button" class="btn btn-default" id="mark-unread" onClick="editReadStatus(this,false)">Mark Unread</button></th>
          <th><form action="http://localhost:3000/links/${data[i].id}/edit"><input type="submit" value="Edit"/></form></th>
          <th style="display:none" class="table-link-id">${data[i].id}</th>
       `
     )
   }
  }
}
function getLinkIndex(){
  clearErrors()
  clearTable()
  clearInput()
  userID = $('#create-link-user-id').val()
  $.ajax({
    url: `http://localhost:3000/api/v1/links?id=${userID}`,
    type: 'get'
  }).done(appendLinkTable).done(callToHotReads)
}

function editReadStatus(page, boolean){
  id = page.parentElement.parentElement.children[5].innerHTML
  readStatus = boolean
  linkParams = {read:readStatus}
  $.ajax({
    url: `http://localhost:3000/api/v1/links/${id}`,
    type: 'put',
    data: linkParams,
  }).done(setTimeout(getLinkIndex, 500)).done(postToHotReads(page, boolean)).done(getLinkIndex)

}

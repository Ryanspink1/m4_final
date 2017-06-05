function postToHotReads(page, boolean){
  if(boolean.toString() == "true"){
    url = {url:page.parentElement.parentElement.children[0].innerHTML}
    $.ajax({
      url: "http://localhost:3001/links",
      type: 'post',
      data: url
    })
  }
}

function postToHotReads(page, boolean){
  if(boolean.toString() == "true"){
    url = {url:page.parentElement.parentElement.children[0].innerHTML}
    $.ajax({
      url: "https://finalhotreads.herokuapp.com/links",
      type: 'post',
      data: url
    })
  }
}

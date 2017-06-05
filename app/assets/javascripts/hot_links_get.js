function callToHotReads(){
  $.ajax({
    url: `http://localhost:3001/api/v1/toplinks `,
    type: 'get'
  }).done(setHotReadsData)
}

function setHotReadsData(data){
  topLink = data[0].url
  hotLinks = []
  for(i=1;i<data.length;i++){
    hotLinks.push(data[i].url)
  }
  appendHotReadsInfo(topLink, hotLinks)
}

function appendHotReadsInfo(topLink, hotLinks){
  linkUrls = $(".table-url")

  for(i=0;i<linkUrls.length;i++){
    if(linkUrls[i].innerHTML == topLink){
      linkUrls[i].parentElement.append(`TOP LINK`)
    }
    else{
      for(l=0;l<hotLinks.length;l++){
        if(linkUrls[i].innerHTML == hotLinks[l]){
          linkUrls[i].parentElement.append("HOT")
        }
      }
    }
  }
}

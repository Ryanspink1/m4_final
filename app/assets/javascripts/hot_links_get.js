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
  debugger;
  // appendHotReadsInfo(topLink, hotLinks)
}

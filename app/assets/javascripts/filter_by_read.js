

function filterByRead(boolean){
  refreshLinkTable();
  debugger;
  var linkTableData = $('.link-table-data')
    for(i=0;i<linkTableData.length;i++){
      debugger;
      if(linkTableData[i].children[2].innerHTML == boolean.toString()){}
      else{
        linkTableData[i].closest('tr').style.display = "none"
      }
    }
}

function refreshLinkTable(){
  var linkTableData = $('.link-table-data')
    for(i=0;i<linkTableData.length;i++){
        linkTableData[i].closest('tr').style.display = ""
    }
}

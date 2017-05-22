

function filterSearch(){
  var input, filter, table, tr, td, i;
  input = document.getElementById("search");
  filter = input.value.toUpperCase();
  table = document.getElementById("links-table");
  tr = table.getElementsByTagName("tr");

  for (i = 2; i < tr.length+2; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    tdOne = tr[i].getElementsByTagName("th")[1];

    if (td || tdOne) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || tdOne.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

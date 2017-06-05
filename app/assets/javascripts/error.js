function error(response){
  $("#js-error-message").append(response.responseText)
}

function clearErrors(){
  $("#js-error-message")[0].innerHTML = ""
}

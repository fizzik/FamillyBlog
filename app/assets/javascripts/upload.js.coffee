# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
log = (html) ->
  document.getElementById("log").innerHTML = html
onSuccess = ->
  log "success"
onError = ->
  log "error"
onProgress = (loaded, total) ->
  log loaded + " / " + total




form = document.forms.upload
form.onsubmit = ->
  file = @elements.photo.files[0]
  upload file, onSuccess, onError, onProgress  if file
  false
token = document.forms.upload.elements["authenticity_token"]
post_id = document.getElementById("book_id")
user_id = document.getElementById("user_id")
if post_id != null
  path = "/posts/#{post_id.value}/photos"
else
  path = "/users/#{user_id.value}/photos"

upload = (file, onSuccess, onError, onProgress) ->
  xhr = new XMLHttpRequest()
  xhr.onload = xhr.onerror = ->
    unless @status is 200
      onError this
      return
    onSuccess()
    if post_id != null
      window.location = "/posts/" + post_id.value
    else
      window.location = "/users/#{user_id.value}"

  xhr.upload.onprogress = (event) ->
    $(document).ready ->
      $bar = $(".bar")
      pc = (parseInt (event.loaded*400 / event.total))
      $bar.width $bar.width() + pc
      #$bar.text  parseInt ((event.loaded*100)/event.total + 1 )
      onProgress event.loaded, event.total

      xhr.open "POST", path, true
  formData = new FormData()
  formData.append "authenticity_token", token.value
  if post_id != null
    formData.append "post_id", post_id.value
  formData.append "photo", file
  xhr.send formData
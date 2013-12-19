jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'  
    cache: true

  window.fbAsyncInit = ->
    FB.init(appId: '190820977620574', cookie: true,frictionlessRequests : true)
    
    FB.getLoginStatus (response) ->
      console.log response.status
      if response.status=='connected'
        $('#btnSelect1').show()
        
    $("#sign_in").click (e) ->
      e.preventDefault()
      FB.login (response) ->
        if response.authResponse    
          sessionStorage.accessToken = response.authResponse.accessToken
          sessionStorage.userID = response.authResponse.userID
          window.location = "/auth/facebook/callback"

    $('#sign_out').click (e) ->
      FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
      true
      
    $('#sendReqToOne').click (e) ->
      user_id = document.getElementsByName("user_id")[0].value
      FB.ui
        method: "apprequests"
        message: "My Great Request"
        to: user_id
      , requestCallback

    # to send request to many friends use this function
    $('#sendReqToMany').click (e) ->
      FB.ui
        method: "apprequests"
        message: "My Great Request"
      , requestCallback
  
    # Handle callback here
    requestCallback = (response) ->
      console.log response
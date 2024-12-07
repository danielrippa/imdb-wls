
  do ->

    { com-object } = dependency 'ComObject'

    http-client = -> com-object 'Msxml2.XMLHTTP.6.0'

    get = (url) ->

      http-client!

        ..open "GET", url, false

        ..set-request-header 'Cache-Control', 'no-cache'
        ..set-request-header 'Pragma', 'no-cache'

        ..send!

        status = ..status
        response = ..response-text

      { status, response }

    {
      http-client,
      get
    }
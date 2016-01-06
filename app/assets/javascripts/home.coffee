$ ->
  $('input').change (e)->
    $('input.parseCSV[type=file]').parse
      before: (file, inputElem) ->
        debugger;
        # executed before parsing each file begins;
        # what you return here controls the flow
        return
      step: (results, parser)->
        debugger;
        return
      error: () ->
        debugger;
        # executed if an error occurs while loading the file,
        # or if before callback aborted for some reason
        return
      complete: (results) ->
        debugger;
        return
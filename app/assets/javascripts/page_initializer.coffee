class @PageInitializer
  init: ->
    element = $('table#tasks')
    if element.length > 0
      new TaskDetailsShower(element).activateBinds()

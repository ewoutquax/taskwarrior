class @TimeFormatter
  constructor: (time) ->
    @time = new Date(time)

  short: ->
    "#{@time.getDate()}-#{@month()} #{@hours()}:#{@minutes()}"

  #
  # Private
  #
  minutes: ->
    "00#{@time.getMinutes()}".substr(-2, 2)

  hours: ->
    @time.getHours()

  month: ->
    @time.getMonth() + 1

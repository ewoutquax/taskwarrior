class @TaskDetailsShower
  constructor: (container) ->
    @table = container
    @list = $('#task_detail')

  activateBinds: ->
    @table.find('tbody tr').find('td:first').each (_idx, element) =>
      td = $(element)
      td.click (event) =>
        tr = td.closest('tr')
        task_uuid = tr.data('uuid')
        @fetchTaskDetails(task_uuid)
        true

  fetchTaskDetails: (uuid) ->
    $.ajax(
      url: "/api/v1/tasks/#{uuid}"
      method: 'get'
      type: 'json'
      success: (data) =>
        @clearDetails()
        @showModelWithDetails(data)
    )

  clearDetails: ->
    @list.find('dd').html('')

  showModelWithDetails: (data) ->
    @list.find('.modal-title').html(data.description)
    @list.find('.next_action').html(data.next_action)
    @list.find('.website').html(data.website)
    @list.find('.project').html(data.project)

class @TaskDetailsShower
  constructor: (container) ->
    @table = container
    @list = $('#task_detail')
    @tags = $('#tags')

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
    @tags.empty()

  showModelWithDetails: (data) ->
    time = new TimeFormatter(data.entry)

    @list.find('.modal-title').html(data.description)
    @list.find('.next_action').html(data.next_action)
    @list.find('.mail_body').html(data.mail_body.replace(/\n/g, '<br />')) if data.mail_body
    @list.find('.website').html(data.website)
    @list.find('.project').html(data.project)
    @list.find('.created').html(time.short())

    @list.find('#edit-task').attr('href', "/tasks/#{data.uuid}/edit")

    @list.find('#annotations').empty()
    $.each(data.annotations, (idx, annotation) =>
      time = new TimeFormatter(annotation.entry)
      item = $('<li>')
      item.addClass('list-group-item')
      item.html("<strong>#{time.short()}</strong><br />#{annotation.description}")
      @list.find('#annotations').append(item)
    )

    $.each(data.tags, (idx, tag) =>
      @tags.append(tag)
      @tags.append('<br />')
    )

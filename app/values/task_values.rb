class TaskValues < Objection::Leasurely::Base
  class Annotations < Objection::Base
    requires :description, :entry
  end

  requires  :description, :entry,     :status,      :uuid
  optionals :annotations, :mail_body, :next_action, :project, :tags, :website

  input_types(
    annotations: Annotations,
    tags:        Array
  )
end

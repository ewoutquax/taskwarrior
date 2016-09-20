class TaskFormValues < Objection::Base
  optionals :uuid,  :description, :next_action, :website, :project
end

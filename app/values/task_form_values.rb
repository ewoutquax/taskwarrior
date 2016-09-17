class TaskFormValues < Objection::Base
  optionals  :description, :next_action, :website, :project
end

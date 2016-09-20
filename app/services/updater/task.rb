module Updater
  class Task
    def initialize(values)
      enforce_argument_type(::TaskValues, values)
      @values = values
    end

    def with_form_values(form_values)
      enforce_argument_type(TaskFormValues, form_values)

      TaskWarrior::TaskUpdater.invoke(@values, form_values)
    end
  end
end

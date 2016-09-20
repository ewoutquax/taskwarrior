module Updater
  class Task
    def initialize(values)
      raise ArgumentError unless values.is_a?(::TaskValues)
      @values = values
    end

    def with_form_values(form_values)
      raise ArgumentError unless form_values.is_a?(::TaskFormValues)

      TaskWarrior::TaskUpdater.invoke(@values, form_values)
    end
  end
end

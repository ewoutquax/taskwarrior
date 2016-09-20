module Creator
  class Task
    def initialize(task_form_values)
      enforce_argument_type(TaskFormValues, task_form_values)
      @task_form_values = task_form_values
    end

    def invoke
      TaskWarrior::TaskCreator.invoke(@task_form_values)
    end
  end
end

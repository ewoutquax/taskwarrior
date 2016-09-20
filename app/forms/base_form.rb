class BaseForm
  include ActiveModel::Model

  attr_reader :model

  def initialize(model, params = nil)
    @model  = model
    @params = params

    if @params.present?
      form_submitted? && assign_params_to_form
    end
  end

  def method_missing(method, *args)
    @model.send(method, *args)
  end

  private

    def form_submitted?
      key = self.model_name.name.underscore.to_sym
      @params.key?(key)
    end

    def assign_params_to_form
      params_for_create.each do |field, value|
        send("#{field}=", value)
      end
    end
end

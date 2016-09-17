class BaseForm
  include ActiveModel::Model

  attr_reader :model

  def initialize(model, params = nil)
    @model  = model
    @params = params

    if @params.present?
      key = self.model_name.name.underscore.to_sym
      @params.key?(key) && assign_params_to_form
    end
  end

  def method_missing(method, *args)
    @model.send(method, *args)
  end

  private

    def assign_params_to_form
      params_for_create.each do |field, value|
        send("#{field}=", value)
      end
    end
end

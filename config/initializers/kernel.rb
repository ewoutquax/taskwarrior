module Kernel
  def enforce_argument_type(klass, arg)
    unless arg.is_a?(klass)
      raise ArgumentError, "Required: '#{klass.to_s}', got: '#{arg.class.to_s}'"
    end
  end
end

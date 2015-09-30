module ExternalErrors
  # Add errors from an external sources (/non-validators) to the model
  #  class SomeModel
  #    include ActiveModel::Model
  #    include ExternalErrors
  #  end
  #
  #  some_instance = SomeModel.new
  #  some_instance.valid?
  #  #=> true
  #
  #  some_instance.external_errors << 'some external error'
  #  some_instance.valid?
  #  #=> false

  class ExternalErrorStore < Array
    def initialize(error_added_cb)
      @error_added_cb = error_added_cb
    end

    def <<(error)
      super error
      @error_added_cb.call(error)
    end
  end

  def self.included(base)
    base.class_eval { validate :check_for_external_errors }
  end

  def add_external_error(error)
    external_errors << error
  end

  def add_external_errors(errors)
    errors.each { |error| add_external_error error }
  end

  def external_errors
    error_added_cb = proc { |error| add_external_error_to_errors error }
    @external_errors ||= ExternalErrorStore.new error_added_cb
  end

  def add_external_error_to_errors(error)
    errors.add(:base, error)
  end

  private

  def check_for_external_errors
    external_errors.each { |error| add_external_error_to_errors error }
  end
end

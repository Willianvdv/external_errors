# External errors
Add errors from an external source to active model. Useful if you validations that are not done by the model's validators.

## Example usage
```
  # Add errors from an external source to the model:
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
```

require './lib/external_errors'
require 'active_model'
require 'minitest/autorun'

class TestExternalErrors < Minitest::Test
  class Dummy
    include ActiveModel::Model
    include ExternalErrors
  end

  def setup
    @dummy = Dummy.new
  end

  def test_valid_without_extrnal_errors
    assert @dummy.valid?
  end

  def test_valid_with_extrnal_errors
    @dummy.external_errors << 'nope, not valid'
    assert @dummy.invalid?
  end
end

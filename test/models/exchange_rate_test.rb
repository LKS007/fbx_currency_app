require 'test_helper'

class ExchangeRateTest < ActiveSupport::TestCase
  test "The Exchange Rate create" do
    
    a = ExchangeRate.new
    a.currency_to_id = 1
    a.currency_from_id = 2
    create_val = a.save
    
    assert_equal false, create_val, "Error while rate is empty"
    assert_equal a.errors[:rate].any?, true

    a.rate = -0.95
    create_var = a.save

    assert_equal ["must be greater than or equal to 0.0"], a.errors[:rate]

    a.rate = 66.95
    create_var = a.save

    assert_equal true, create_var

    #assert true
  end
end

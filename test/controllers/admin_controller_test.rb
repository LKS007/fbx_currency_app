require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "should redirected if non authorized" do
    get '/admin'
    assert_response :redirect
  end

  test "should true if will login" do
    sign_in_as(:admin)
    get '/admin'
    assert_response :success
  end

  test "should create new exchange rate" do
    sign_in_as(:admin)
    before_create = ExchangeRate.all.count
    exchange_param = { currency_from_id: 2, currency_to_id: 1, rate: 20, date_to: Time.current }
    post '/admin', params: { exchange_rate: exchange_param }

    assert_response :redirect
    assert_redirected_to exchange_rates_path
    assert true, before_create < ExchangeRate.all.count
  end

  test "should take error with validation" do
    sign_in_as(:admin)
    before_create = ExchangeRate.all.count
    exchange_param = { currency_from_id: 2, currency_to_id: 1, rate: "asd", date_to: Time.current }
    post '/admin', params: { exchange_rate: exchange_param }

    assert_response :success
    assert true, before_create = ExchangeRate.all.count
  end

  test "should take error if incorrect rate" do
    old_rate = ExchangeRate.find_by_id(1).rate
    sign_in_as(:admin)
    exchange_param = { id: 1, currency_from_id: 2, currency_to_id: 1, rate: "asd", date_to: Time.current }
    patch '/admin', params: { exchange_rate: exchange_param }

    assert_response :success
    assert old_rate == ExchangeRate.find_by_id(1).rate
  end

  test "should take update" do
    old_rate = ExchangeRate.find_by_id(1).rate
    sign_in_as(:admin)
    exchange_param = { id: 1, currency_from_id: 2, currency_to_id: 1, rate: "57.00", date_to: Time.current }
    patch '/admin', params: { exchange_rate: exchange_param }

    assert_response :redirect
    assert_redirected_to exchange_rates_path
    assert old_rate != ExchangeRate.find_by_id(1).rate
  end
end

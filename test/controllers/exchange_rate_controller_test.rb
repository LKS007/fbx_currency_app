require 'test_helper'

class ExchangeRateControllerTest < ActionDispatch::IntegrationTest
  test "should update info" do
    before_update = exchange_rates(:not_force).rate
    get "/exchange_rates/update"

    assert_response :redirect
    assert before_update != ExchangeRate.find_by_id(exchange_rates(:not_force).id).rate
  end

  test "not delete" do
    sign_in_as(:admin)
    count_before_delete = ExchangeRate.all.count

    assert_raises ("ActionController::UrlGenerationError") do
      delete remove_exchange_rate_path
    end
    assert count_before_delete == ExchangeRate.all.count
  end

  test "should delete ex_rate" do
    sign_in_as(:admin)
    count_before_delete = ExchangeRate.all.count
    @ex_rate = ExchangeRate.find_by_id(1)

    delete remove_exchange_rate_path(@ex_rate)
    assert count_before_delete != ExchangeRate.all.count
    assert_response :redirect
  end
end

class TestNotifier < ApplicationMailer
  def received
    @greeting = "Hi"
    mail to: "to@example.com"
  end
end

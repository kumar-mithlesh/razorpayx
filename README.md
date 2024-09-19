# config/initializers/razorpay_x.rb

RazorpayX.configure do |config|
  config.username = ENV['razorpay_username'] # Ideally, use environment variables for sensitive data
  config.password = ENV['razorpay_secret']
end

# frozen_string_literal: true

# The RazorpayX module encapsulates the RazorpayX API's client functionality,
# including base setup and specific API endpoints like Contact, FundAccount, and Payout.
class Razorpayx
  VERSION = '0.1.0'

  require_relative 'razorpay_x/base'
  require_relative 'razorpay_x/contact'
  require_relative 'razorpay_x/fund_account'
  require_relative 'razorpay_x/payout'
end

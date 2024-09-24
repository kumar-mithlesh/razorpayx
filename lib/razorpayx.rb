# frozen_string_literal: true

# The RazorpayX module encapsulates the RazorpayX API's client functionality,
# including base setup and specific API endpoints like Contact, FundAccount, and Payout.
#

require_relative 'razorpay_x/base'
require_relative 'razorpay_x/contact'
require_relative 'razorpay_x/fund_account'
require_relative 'razorpay_x/payout'
require_relative 'razorpay_x/configuration'
require_relative 'razorpay_x/payout_links'
require_relative 'razorpay_x/transaction'
module RazorpayX
  class << self
    def configuration
      @configuration ||= RazorpayX::Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end

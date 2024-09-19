# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX FundAccount functionalities
  class FundAccount < Base
    class << self
      def create(options = {})
        response = post('fund_accounts', options)
        handle_response(response)
      end

      def all
        response = get('fund_accounts')
        handle_response(response)
      end

      def find(fund_account_id)
        response = get("fund_accounts/#{fund_account_id}")
        handle_response(response)
      end

      def update(fund_account_id, options = {})
        response = patch("fund_accounts/#{fund_account_id}", options)
        handle_response(response)
      end

      private

      def handle_response(response)
        if response.success?
          JSON.parse(response.body)
        else
          handle_error(response)
        end
      end
    end
  end
end

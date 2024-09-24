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

      def validate(options = {})
        response = post('fund_accounts/validations', options)
        handle_response(response)
      end

      def validate_by_id(fund_account_validation_id)
        response = get("fund_accounts/validations/#{fund_account_validation_id}")
        handle_response(response)
      end

      def fetch_validations
        response = get('fund_accounts/validations')
        handle_response(response)
      end
    end
  end
end

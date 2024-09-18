# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX FundAccount functionalities
  class FundAccount < Base
    class << self
      def create(options = {})
        options = options.symbolize_keys.slice(*permitted_keys)

        response = post('/fund_accounts', options.to_json)
        if response.success?
          JSON.parse(response.body)
        else
          handle_error(response)
        end
      end

      private

      def permitted_keys
        %i[contact_id account_type vpa]
      end
    end
  end
end

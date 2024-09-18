# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Payout functionalities
  class Payout < Base
    class << self
      def create(options = {})
        options = options.symbolize_keys.slice(*permitted_keys)

        response = post('/payouts', options.to_json, idempotency: options[:idempotency_key])
        if response.success?
          JSON.parse(response.body)
        else
          handle_error(response)
        end
      end

      private

      def permitted_keys
        %i[account_number fund_account_id amount currency mode purpose queue_if_low_balance reference_id]
      end
    end
  end
end

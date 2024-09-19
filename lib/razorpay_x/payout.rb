# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Payout functionalities
  class Payout < Base
    class << self
      def create(options = {})
        response = post('payouts', options, { idempotency: idempotency })
        handle_response(response)
      end

      def all(account_number)
        response = get("payouts?account_number=#{account_number}")
        handle_response(response)
      end

      def find(payout_id)
        response = get("payouts/#{payout_id}")
        handle_response(response)
      end

      def cancel(payout_id)
        response = post("payouts/#{payout_id}/cancel")
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

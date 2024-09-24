# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Payout functionalities
  class PayoutLinks < Base
    class << self
      def create(options = {})
        response = post('payout-links', options)
        handle_response(response)
      end

      def all
        response = get('payout-links')
        handle_response(response)
      end

      def find(payout_link_id)
        response = get("payout-links/#{payout_link_id}")
        handle_response(response)
      end

      def cancel(payout_link_id)
        response = post("payout-links/#{payout_link_id}/cancel")
        handle_response(response)
      end
    end
  end
end

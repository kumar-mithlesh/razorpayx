# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Transaction functionalities
  class Transaction < Base
    class << self
      def all(account_number)
        response = get("transactions?account_number=#{account_number}")
        handle_response(response)
      end

      def find(transaction_id)
        response = get("transactions/#{transaction_id}")
        handle_response(response)
      end
    end
  end
end

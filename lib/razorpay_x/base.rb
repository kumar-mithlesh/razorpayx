# frozen_string_literal: true

# This module encapsulates the RazorpayX functionalities
module RazorpayX
  # Base class for RazorpayX operations
  # Provides methods for authentication and making HTTP requests
  class Base
    class << self
      def authrization
        username = Rails.application.credentials.dig(:razorpayx, :username)
        password = Rails.application.credentials.dig(:razorpayx, :password)
        "Basic #{Base64.strict_encode64("#{username}:#{password}")}"
      end

      def post(url, body, options = {})
        HTTParty.post(
          request_url(url),
          headers: {
            'Authorization' => authrization,
            'Content-Type' => 'application/json',
            'X-Payout-Idempotency' => options[:idempotency] || SecureRandom.uuid
          },
          body: body
        )
      end

      def get(url)
        HTTParty.get(
          request_url(url),
          headers: {
            'Authorization' => self.class.authrization,
            'Content-Type' => 'application/json'
          }
        )
      end

      def handle_error(response)
        {
          error: "HTTP Error: #{response.code} - #{response.message}",
          body: JSON.parse(response.body)
        }
      end

      private

      def base_url
        'https://api.razorpay.com/v1'
      end

      def request_url(endpoint)
        "#{base_url}/#{endpoint}"
      end
    end
  end
end

# frozen_string_literal: true

require 'faraday'
require 'base64'
require 'securerandom'

# This module encapsulates the RazorpayX functionalities
module RazorpayX
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Base
    class << self
      def authorization
        username = RazorpayX.configuration.username
        password = RazorpayX.configuration.password
        "Basic #{Base64.strict_encode64("#{username}:#{password}")}"
      end

      def post(url, body, options = {})
        response = Faraday.post(request_url(url)) do |req|
          req.headers = build_headers(options[:idempotency])
          req.body = body.to_json
        end

        handle_error(response) unless response.success?
        response
      end

      def get(url)
        response = Faraday.get(request_url(url)) do |req|
          req.headers = build_headers
        end

        handle_error(response) unless response.success?
        response
      end

      private

      def base_url
        'https://api.razorpay.com/v1'
      end

      def request_url(endpoint)
        "#{base_url}/#{endpoint}"
      end

      def build_headers(idempotency = SecureRandom.uuid)
        {
          'Authorization' => authorization,
          'Content-Type' => 'application/json',
          'X-Payout-Idempotency' => idempotency
        }
      end

      def handle_error(response)
        raise StandardError, "HTTP Error: #{response.status} - #{response.reason_phrase}. Body: #{response.body}"
      end
    end
  end
end

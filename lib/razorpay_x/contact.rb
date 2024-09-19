# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Contact functionalities
  class Contact < Base
    class << self
      def create(options = {})
        response = post('contacts', options)
        handle_response(response)
      end

      def all
        response = get('contacts')
        handle_response(response)
      end

      def find(contact_id)
        response = get("contacts/#{contact_id}")
        handle_response(response)
      end

      def update(contact_id, options = {})
        response = patch("contacts/#{contact_id}", options)
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

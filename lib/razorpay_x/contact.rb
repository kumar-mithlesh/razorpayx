# frozen_string_literal: true

module RazorpayX
  # This class encapsulates the RazorpayX Contact functionalities
  class Contact < Base
    class << self
      def create(options = {})
        options = options.slice(*permitted_keys)

        response = post('/contacts', options.to_json)
        if response.success?
          JSON.parse(response.body)
        else
          handle_error(response)
        end
      end

      private

      def permitted_keys
        %i[name email contact type reference_id notes]
      end
    end
  end
end

require 'razorpay_x/base'
require 'razorpay_x/contact'
require 'webmock/rspec'
require 'byebug'

RSpec.describe RazorpayX::Contact do
  describe '.create' do
    let(:contact_params) do
      {
        name: 'John Doe',
        email: 'john.doe@example.com',
        contact: '1234567890',
        type: 'employee',
        reference_id: 'ref123',
        notes: { key1: 'value1' }
      }
    end

    context 'when the request is successful' do
      before do
        stub_request(:post, 'https://api.razorpay.com/v1/contacts')
          .with(body: contact_params.to_json)
          .to_return(status: 200, body: contact_params.merge(id: 'contact_123').to_json)
      end

      it 'creates a new contact and returns the contact details' do
        response = described_class.create(contact_params)
        expect(response['id']).to eq('contact_123')
        expect(response['name']).to eq('John Doe')
      end
    end

    context 'when the request fails' do
      before do
        stub_request(:post, 'https://api.razorpay.com/v1/contacts')
          .with(body: contact_params.to_json)
          .to_return(status: 400, body: { error: 'Bad Request' }.to_json)
      end

      it 'handles the error' do
        expect { described_class.create(contact_params) }
          .to raise_error # Adjust based on how handle_error is implemented
      end
    end
  end
end

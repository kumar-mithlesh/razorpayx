require 'razorpay_x/configuration'

RSpec.describe RazorpayX::Configuration do
  describe '#username' do
    it 'can set and return a username' do
      RazorpayX.configure do |config|
        config.username = 'test_username'
      end

      expect(RazorpayX.configuration.username).to eq('test_username')
    end
  end

  describe '#password' do
    it 'can set and return a password' do
      RazorpayX.configure do |config|
        config.password = 'test_password'
      end

      expect(RazorpayX.configuration.password).to eq('test_password')
    end
  end

  # Optionally, you can add a test to ensure the configuration can be reset or re-configured
  describe 'reconfiguration' do
    it 'allows reconfiguration of the settings' do
      RazorpayX.configure do |config|
        config.username = 'first_username'
        config.password = 'first_password'
      end

      RazorpayX.configure do |config|
        config.username = 'second_username'
        config.password = 'second_password'
      end

      expect(RazorpayX.configuration.username).to eq('second_username')
      expect(RazorpayX.configuration.password).to eq('second_password')
    end
  end
end

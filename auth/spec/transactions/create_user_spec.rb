require 'spec_helper'

RSpec.describe Auth::Transactions::Users::CreateUser do
  context "valid input" do
    let(:input) do
      {
        name: "Bigg",
        email: "test@test.com",
        password: '123'
      }
    end

    let(:result) { subject.call(input) }

    it "is valid" do
      expect(result).to be_success
    end

    it "is valid" do
      hashed_password = BCrypt::Password.new(result.value!.password_digest)

      expect(hashed_password).to eq(input[:password])
    end
  end
end

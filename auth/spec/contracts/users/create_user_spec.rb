require 'spec_helper'

RSpec.describe Auth::Contracts::Users::CreateUser do
  context "requires first_name" do
    let(:input) do
      {
        name: "Bigg",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:email]).to include("is missing")
    end
  end

  context "requires email" do
    let(:input) do
      {
        email: "test@example.com",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:name]).to include("is missing")
    end
  end

  context "requires password" do
    let(:input) do
      {
        email: "test@example.com",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:password]).to include("is missing")
    end
  end
end

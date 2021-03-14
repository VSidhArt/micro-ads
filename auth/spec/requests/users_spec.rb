require "web_helper"

RSpec.describe "/signup" do
  context "POST /" do
    let(:user_params) do
      {
        name: 'Igansio',
        email: 'ignat@ya.ru',
        password: 'admin'
      }
    end
    let!(:user) { Auth::Transactions::Users::CreateUser.new.call(user_params).value! }
    let!(:session_params) do
      {
        user_id: user.id
      }
    end
    let(:session) { Auth::Transactions::Users::CreateUserSession.new.call(session_params).value! }

    context "with valid input" do
      let(:input) do
        {
          name: "Dipak",
          email: "test@test.com",
          password: '123',
        }
      end

      it "succeeds" do
        post_json "/signup", input, 'Authorization' => "Bearer #{JWT.encode(session.uuid, ENV['MASTER_SECRET'])}"

        expect(last_response.status).to eq(201)
      end
    end

    context "with invalid input" do
      let(:input) do
        {
          name: "Gleb",
        }
      end

      it "returns an error" do
        post_json "/signup", input, 'Authorization' => "Bearer #{JWT.encode(session.uuid, ENV['MASTER_SECRET'])}"
        expect(last_response.status).to eq(422)
        user = parsed_body
        expect(user["errors"]["email"]).to include("is missing")
      end
    end
  end
end

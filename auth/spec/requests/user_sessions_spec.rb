require "web_helper"

RSpec.describe "/user_sessions" do
  context "POST /" do
    context "with valid input" do
      let(:user_params) do
        {
          name: 'Igansio',
          email: 'ignat@ya.ru',
          password: 'admin'
        }
      end
      let!(:user) { Auth::Transactions::Users::CreateUser.new.call(user_params).value! }

      context 'when user exists' do
        let(:input) do
          {
            email: 'ignat@ya.ru',
            password: 'admin',
          }
        end

        it "succeeds" do
          post_json "/login", input

          expect(last_response.status).to eq(201)
        end
      end

      context 'when wrong password' do
        let(:input) do
          {
            email: 'ignat@ya.ru',
            password: 'wrong',
          }
        end

        it "succeeds" do
          post_json "/login", input

          expect(last_response.status).to eq(403)
        end
      end
    end
  end
end

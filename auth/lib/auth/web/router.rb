module Auth
  module Web
    Router = Hanami::Router.new do
      post "/signup", to: Controllers::Users::Create
      post "/login", to: Controllers::Users::Login
    end
  end
end

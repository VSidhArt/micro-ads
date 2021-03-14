Auth::Application.boot(:web) do |app|
  init do
    require "hanami-controller"
    require "hanami-router"
    require "jwt"
  end
end

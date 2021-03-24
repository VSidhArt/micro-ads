require_relative "config/application"

Auth::Application.finalize!

run Auth::Web.app

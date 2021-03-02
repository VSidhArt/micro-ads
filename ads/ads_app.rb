require 'yaml'

class AdsApp < Sinatra::Application
  set :app_file, __FILE__
  set :server, :puma

  configure do
    Sequel::Database.extension :pagination
    Sequel::Model.plugin :timestamps
    Sequel::Model.plugin :auto_validations,
      not_null: :presence, unique_opts: { only_if_modified: true }
  end

  configure :development do
    require 'sinatra/reloader'
    require 'logger'

    register Sinatra::Reloader
    Sequel.connect YAML.load_file(File.expand_path("../config/database.yml", __FILE__))['development'],
      loggers: [Logger.new($stdout)]
  end

  configure :test do
    Sequel.connect YAML.load_file(File.expand_path("../config/database.yml", __FILE__))['test']
  end

  configure :production do
    Sequel.connect YAML.load_file(File.expand_path("../config/database.yml", __FILE__))['production']
  end
end

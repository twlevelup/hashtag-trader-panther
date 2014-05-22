require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require 'omniauth'
require 'omniauth-github'
require 'sinatra/base'
require 'sinatra/twitter-bootstrap'
require 'rack/ssl-enforcer'
require 'haml'

require_relative 'models/testmodel'
require_relative 'models/user'
require_relative 'configuration'
require_relative 'routes/dashboard'
require_relative 'routes/authorization'
require_relative 'routes/registration'
class HashTagTraderApp < Sinatra::Base
  set :root, File.dirname(__FILE__)

  use Rack::SslEnforcer, :only_hosts => /.*\.herokuapp\.com$/
  set :session_secret, '97b1bbfffbd8e70979f375bde519bdc313b0a549b323cfa2ae74c615f9e42e04'

  #Enable sinatra sessions
  use Rack::Session::Cookie, :key => '_rack_session',
                             :path => '/',
                             :expire_after => 2592000, # In seconds
                             :secret => settings.session_secret


  configuration = Configuration.new
  configure do
    set :configuration, configuration
  end

  use OmniAuth::Builder do
    configuration.omniauth_providers.each do |provider_config|
      provider provider_config.id, *provider_config.parameters
    end
  end

  before do
    pass if request.path_info =~ /^\/(auth|css|js)\//

    redirect to("/auth/") unless session[:uid]
  end


  register Sinatra::Twitter::Bootstrap::Assets

  register HashTagTrader::Routes::Dashboard
  register HashTagTrader::Routes::Authorization
  register HashTagTrader::Routes::Registration

end

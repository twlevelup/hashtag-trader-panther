require 'rack/test'
require 'app'

include Rack::Test::Methods

def app
  HashTagTraderApp
end

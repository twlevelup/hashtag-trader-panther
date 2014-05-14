module HashTagTrader
  module Routes
    module Index
      def self.registered(app)
        app.get '/' do
          haml :index


        end

        app.get '/auth/github/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
    #redirect to('/github_callback')
      haml :auth_github_callback
        end

      end
    end
  end
end

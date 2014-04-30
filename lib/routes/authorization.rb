module HashTagTrader
  module Routes
    module Authorization
      def self.registered(app)
        app.get '/auth/' do
          @configuration = Configuration.new
          haml :auth
        end

        app.post '/auth/developer/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
          redirect to('/')
        end

        app.get '/auth/github/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
	  redirect to('/')
        end

	app.get '/auth/failure' do
	  flash[:notice] = params[:message]
	  redirect to('/')
	end
      end
    end
  end
end

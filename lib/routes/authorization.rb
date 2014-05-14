module HashTagTrader
  module Routes
    module Authorization
      def self.registered(app)
        app.get '/auth/' do
          @configuration = Configuration.new
          haml :auth
        end
#test
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
	
	app.get '/logout' do
	  session[:uid] = nil
	  session[:name] = nil
   	  haml :logout
	end
      end
    end
  end
end

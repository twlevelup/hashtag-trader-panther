module HashTagTrader
  module Routes
    module Authorization
      def self.registered(app)
        app.get '/auth/' do
          @configuration = Configuration.new
          haml :auth_before_login
        end

        app.post '/auth/developer/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
          redirect to('/')
        end


        app.get '/auth/failure' do
          flash[:notice] = params[:message]
          redirect to('/')
        end


        app.get '/auth/github/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
    #redirect to('/github_callback')
          github_email = puts env['omniauth.auth'][:info][:email]
          user = User.find_by(email: github_email)
          if user==nil
            redirect to('/registration')
            #haml :registration
          else
            redirect to('/dashboard')
            #haml :dashboard
          end


    #check if the user is already registered within #hashtagTrader
    #if yes, direct to dashboard
    #if not, direct to register page




      #haml :auth_github_callback
        end


        app.post '/registration' do
          puts params
          puts params[:inputPassword]

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

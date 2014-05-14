module HashTagTrader
  module Routes
    module Dashboard
      def self.registered(app)
        app.get '/dashboard' do
          haml :dashboard


        end
        app.get '/' do
          haml :dashboard

        end

      end
    end
  end
end

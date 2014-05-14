module HashTagTrader
  module Routes
    module Registration
      def self.registered(app)
        app.get '/registration' do
          haml :registration
        end

      end
    end
  end
end

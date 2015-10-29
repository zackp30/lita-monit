require "lita"

module Lita
  module Handlers
    class Monit < Handler
      def self.default_config(config)
        config.rooms = :all
        config.token = nil
        config.pings = nil
      end

      http.post "/monit", :receive

      def receive(request, response)
        return unless token_valid?(request)
        params = build_params(request.params)

        message = build_message(params)
        target = Source.new(room: Lita.config.handlers.monit.rooms)
        robot.send_message(target, message)
      end

      private
      def build_params(params)
        {"message" => "", "service" => "", "description" => ""}.merge!(params)
      end

      def token_valid?(request)
        token = Lita.config.handlers.monit.token
        begin
          token.eql? request.params["token"]
        rescue
          false
        end
      end

      def build_message(params)
        <<-MSG.chomp
[Alert] #{params['message']}
From #{params['service']}
Description #{params['description']}
(Ping #{Lita.config.handlers.monit.pings})
        MSG
      end
    end

    Lita.register_handler(Monit)
  end
end

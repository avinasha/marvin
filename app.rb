require 'sinatra/base'
require 'sinatra-initializers'
require 'json'

module Marvin
  class App < Sinatra::Base
  
    register Sinatra::Initializers
  
    post '/supportbee' do
      json = JSON.parse(request.body.read.to_s)
      payload = json['payload']
      if payload['action_type'] == 'ticket_created'
        speech = "[#{payload['company']['name']}:New Ticket] #{payload['ticket']['subject']}\n https://#{payload['company']['subdomain']}.supportbee.com/tickets/#{payload['ticket']['id']}"
        CAMPFIRE.speak speech
      end
      body ''
    end
  
    run! if app_file == $0
  end
end
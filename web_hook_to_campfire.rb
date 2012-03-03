require 'sinatra'
require 'json'
require 'tinder'

campfire = Tinder::Campfire.new 'supportbee', :token => '3b6227280f2699d4a85144e131bfe73ee85581ba'
room = campfire.find_room_by_id(356788)

post '/supportbee' do
  puts 'IN POST'
  json = JSON.parse(request.body.read.to_s)
  payload = json['payload']
  if payload['action_type'] == 'ticket_created'
    speech = "[#{payload['company']['name']}:New Ticket] #{payload['ticket']['subject']}\n https://#{payload['company']['subdomain']}.supportbee.com/tickets/#{payload['ticket']['id']}"
    room.speak speech
  end
end
CAMPFIRE = Marvin::Campfire.new ({
                :account => ENV['MARVIN_CAMPFIRE_ACCOUNT'], 
                :token => ENV['MARVIN_CAMPFIRE_TOKEN'], 
                :room_ids => ENV['MARVIN_CAMPFIRE_ROOM_IDS']
              })
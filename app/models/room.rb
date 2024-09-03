class Room < ApplicationRecord
    has_many :messages , dependent: :destroy
    def find_room_for_current_user(room , current_user)
        all_message = room.messages
        
        all_message.each do |message|
          if message.user_id == current_user
            return true
          end
        end
        false 
    end
end

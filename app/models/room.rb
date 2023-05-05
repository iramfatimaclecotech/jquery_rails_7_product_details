class Room < ApplicationRecord
    # after_create_commit { broadcast_append_to :rooms_list }
    # after_update_commit { broadcast_replace_to :rooms_list }
    # after_destroy_commit { broadcast_remove_to :rooms_list }
    # after_create_commit do
    #    broadcast_append_to :rooms_list, target: "room_content", partial: "rooms/room", locals: { Room: self} 
    # end

    after_update_commit do
        broadcast_replace_to :rooms_list, target: "room_content", partial: "rooms/room", locals: { Room: self} 
    end

    # after_destroy_commit do
    #     broadcast_remove_to :rooms_list, target: "room_content"
    # end
   
end


module Flats
  module Broadcast extend ActiveSupport::Concern
    def send_partial_count
      broadcast_update_to(
        'flats',
        target: 'total_flats',
        partial: 'public/flats/total_flats',
        locals: { total_flats: Flat.count }
      )
    end
  
    def send_partial_table
      broadcast_update_to(
        'flats',
        target: 'flats_list',
        partial: "public/flats/flats_list",
        locals: {
          flats: Flat.all
        }
      )
    end
  
    def send_partial_user_table
      broadcast_update_to(
        'users',
        target: 'users_list',
        partial: "public/users/users_list",
        locals: {
          users: User.all
        }
      )
    end
  end
end
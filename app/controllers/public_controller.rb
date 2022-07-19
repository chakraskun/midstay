class PublicController < ::ApplicationController
  def index
    @total_users = User.count
    @total_flats = Flat.count
    @users = User.all
    @flats = Flat.all
    @new_user = User.new
    @new_flat = Flat.new
  end
end
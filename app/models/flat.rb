class Flat < ApplicationRecord
  include Flats::Broadcast
  include Flats::Helpers
  include Flats::AssignNeighborhood
  include Flats::CoordinatesValidation

  has_many :users
  belongs_to :neighborhood
  validates :name, presence: true
  validate :longitude_validation, on: :create
  validate :latitude_validation, on: :create

  after_commit :send_partial_count, on: [ :create ]
  after_commit :send_partial_table, on: [ :create ]
  after_commit :send_partial_user_table, on: [ :create ]
end

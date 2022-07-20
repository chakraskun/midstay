class User < ApplicationRecord
  belongs_to :flat, optional: true
  validates :name, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  after_commit :send_partial_count, on: [ :create ]
  after_commit :send_partial_table, on: [ :create, :update ]
  after_update :send_notification
  after_update :send_partial_flat_table

  default_scope { order(created_at: :desc) }

  def send_partial_count
    broadcast_update_to(
      'users',
      target: 'total_users',
      partial: 'public/users/total_users',
      locals: { total_users: User.count }
    )
  end

  def send_partial_table
    broadcast_update_to(
      'users',
      target: 'users_list',
      partial: "public/users/users_list",
      locals: {
        users: User.all
      }
    )
  end

  def send_notification
    broadcast_update_to(
      'notif',
      target: 'notification_success',
      partial: 'public/notifications_success',
      locals: {
        var: self,
        status: "show",
        message: "User #{self.name} has been updated"
      }
    )
  end

  def send_partial_flat_table
    broadcast_update_to(
      'flats',
      target: 'flats_list',
      partial: "public/flats/flats_list",
      locals: {
        flats: Flat.all
      }
    )
  end
end

class UsersController < ::ApplicationController
  def create
    user = User.new(user_params)
    unless user.save
      render(
        turbo_stream: turbo_stream.update(
          "notification_error",
          partial: "public/notifications",
          locals: {
            var: user
          }
        )
      )
    end
  end
  
  def update
    user = User.find(params[:id])
    user.flat_id = params[:user][:flat_id]
    unless user.save
      render(
        turbo_stream: turbo_stream.update(
          "notification_error",
          partial: "public/notifications",
          locals: {
            var: user
          }
        )
      )
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
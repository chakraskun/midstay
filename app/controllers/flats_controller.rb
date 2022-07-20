class FlatsController < ::ApplicationController
  def create
    flat = Flat.new(flat_params)
    unless flat.save
      render(
        turbo_stream: turbo_stream.update(
          "notification_error",
          partial: "public/notifications",
          locals: {
            var: flat
          }
        )
      )
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :longitude, :latitude)
  end
end
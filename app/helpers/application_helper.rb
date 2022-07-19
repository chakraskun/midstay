module ApplicationHelper
  def options_flats
    Flat.all.pluck(:name, :id).map { |name, id| [name, id] }.unshift(["None", nil])
  end
end

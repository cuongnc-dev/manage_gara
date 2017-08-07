module ApplicationHelper
  def is_active controller
    params[:controller] == controller ? "active" : ""
  end
end

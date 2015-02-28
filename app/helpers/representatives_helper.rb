module RepresentativesHelper
  def sti_representative_path(type = "representative", representative = nil, action = nil)
    send "#{format_sti(action, type, representative)}_path", representative
  end

  def format_sti(action, type, representative)
    action || representative ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end

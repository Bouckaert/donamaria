class Stats < ActiveRecord::Base
  serialize :mapping, ActiveSupport::HashWithIndifferentAccess

  def method_missing(method_name, *arguments, &block)
    method_name != :mapping ? (mapping[method_name] || super) : super
  end

  def respond_to_missing?(method_name, include_private = false)
    mapping.has_key?(method_name) || super
  end
end

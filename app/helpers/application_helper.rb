module ApplicationHelper
  def attributes_t(label)
    I18n.t("activerecord.attributes.#{label}")
  end
end

# frozen_string_literal: true

module FieldsHelper
  def format_field(field)
    case field.attribute
    when :cpf then CPF.new(field.resource.cpf).formatted
    when :cnpj then CNPJ.new(field.resource.cnpj).formatted
    when :phone then Phonelib.parse(field.resource.phone).local_number
    when :city then field.resource.city.capitalize
    when :cv_link then curriculum_link(field.resource.cv_link)
    else
      field.resource.send(field.attribute)
    end
  end

  def format_select(field)
    case field.attribute
    when :status then field.resource.status_humanize
    when :admin then field.resource.admin? ? t('users.index.is_admin') : t('users.index.is_user')
    else
      field.resource.send(field.attribute)
    end
  end

  def curriculum_link(url)
    link_to I18n.t('views.applier.cv_link'), url
  end
end

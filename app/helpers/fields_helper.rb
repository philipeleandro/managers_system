# frozen_string_literal: true

module FieldsHelper
  def format_field(field)
    case field.attribute
    when :cpf then CPF.new(field.resource.cpf).formatted
    when :cnpj then CNPJ.new(field.resource.cnpj).formatted
    when :phone then Phonelib.parse(field.resource.phone).local_number
    when :city then field.resource.city.capitalize
    when :attachment then curriculum_link(field.resource.attachment)
    else
      field.resource.send(field.attribute)
    end
  end

  def translate_field(field)
    case field.attribute
    when :status then field.resource.status_humanize
    when :admin then field.resource.admin? ? t('users.index.is_admin') : t('users.index.is_user')
    when :paid then field.resource.paid? ? t('recruitments.show.paid') : t('recruitments.show.not_paid')
    when :hirer then field.resource.hirer.company_name
    else
      field.resource.send(field.attribute)
    end
  end

  def curriculum_link(file)
    return t('applier.message.no_file') unless file.attached?

    link_to t('applier.message.open_file'), url_for(file), target: '_blank', rel: 'noopener'
  end

  def custom_select(field)
    return field.associated_resource_options unless field.attribute == :hirer

    class_name = field.attribute.to_s.classify.constantize

    class_name.pluck(:company_name, :id)
  end
end

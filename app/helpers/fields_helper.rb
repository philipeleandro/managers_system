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

  def format_select(field)
    case field.attribute
    when :status then field.resource.status_humanize
    else
      field.resource.send(field.attribute)
    end
  end

  def curriculum_link(file)
    return t('applier.message.no_file') unless file.attached?

    link_to t('applier.message.open_file'), url_for(file), target: '_blank', rel: 'noopener'
  end
end

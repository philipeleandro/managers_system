# frozen_string_literal: true

module HirerHelper
  def format_field(field)
    case field.attribute
    when :cpf then CPF.new(field.resource.cpf).formatted
    when :cnpj then CNPJ.new(field.resource.cnpj).formatted
    when :phone then Phonelib.parse(field.resource.phone).local_number
    else
      field.resource.send(field.attribute)
    end
  end
end

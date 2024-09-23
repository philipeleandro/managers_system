# frozen_string_literal: true

module Validator
  class Documents
    def self.valid_cpf?(cpf_number)
      cpf_instance = CPF.new(cpf_number)

      cpf_instance.valid?
    end

    def self.valid_cnpj?(cnpj_number)
      return true if cnpj_number.blank?

      document_instance = CNPJ.new(cnpj_number)

      document_instance.valid?
    end
  end
end

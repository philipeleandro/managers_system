require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#presence" do
    it "is valid" do
      client = build(:client)

      expect(client).to be_valid
    end

    it "is not valid without a name" do
      empty_client = build(:client, name: '')

      expect(empty_client).not_to be_valid
    end

    it "is not valid without a company_name" do
      empty_client = build(:client, company_name: '')

      expect(empty_client).not_to be_valid
    end

    it "is not valid without a phone" do
      empty_client = build(:client, phone: '')

      expect(empty_client).not_to be_valid
    end

    it "is not valid without an email " do
      empty_client = build(:client, email: '')

      expect(empty_client).not_to be_valid
    end

    it "is not valid without a cpf " do
      empty_client = build(:client, cpf: '')

      expect(empty_client).not_to be_valid
    end
  end

  describe "#uniqueness" do
    let(:client)  { build(:client) }

    it "is not valid with duplicate emails" do
      duplicate_client = Client.new(name: 'Jane Doe', email: 'joao@doe.com',
                                    cpf: '98765432100', cnpj: '98765432000199')

     expect(duplicate_client).not_to be_valid
    end

    it "is not valid with duplicate cpf" do
      duplicate_client = Client.new(name: 'Jane Doe', email: 'jane@doe.com',
                                    cpf: '98765432100', cnpj: '10896777000130')

     expect(duplicate_client).not_to be_valid
    end

    it "is not valid with duplicate cnpj" do
      duplicate_client = Client.new(name: 'Jeff Doe', email: 'jeff@doe.com',
                                    cpf: '62398144151', cnpj: '98765432000199')

     expect(duplicate_client).not_to be_valid
    end
  end

  describe "#format" do
    let(:invalid_client)  { build(:client, email: 'bla#23') }

    it { expect(invalid_client).not_to be_valid }
  end
end

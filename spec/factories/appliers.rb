# frozen_string_literal: true

FactoryBot.define do
  factory :applier do
    name { 'MyString' }
    email { 'MyString@testing.com' }
    phone { '11922223333' }
    state { 'MyString' }
    city { 'MyString' }

    after(:build) do |applier|
      applier.attachment.attach(
        io: StringIO.new('%PDF-1.4\n%example PDF content'),
        filename: 'test_pdf.pdf',
        content_type: 'application/pdf'
      )
    end
  end

  factory :second_applier, class: 'Applier' do
    name { 'Ana' }
    email { 'ana@testing.com' }
    phone { '11933332222' }
    state { 'SP' }
    city { 'String' }

    after(:build) do |applier|
      applier.attachment.attach(
        io: StringIO.new('%PDF-1.4\n%example PDF content'),
        filename: 'test_pdf.pdf',
        content_type: 'application/pdf'
      )
    end
  end
end

include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :document do
    name            "Example Document"
    permit_number   "12345 Permit Number"
    expiration_date 2014-12-31
    user_id         1
    doc_type_id     1
    document_upload { fixture_file_upload(Rails.root.join('spec', 'factories', 'pdf-sample.pdf'), 'pdf') }
  end
  factory :doc_type do
    description       "Example Doc Type"
    issuing_authority "Example Issuing Authority"
    area_id           1
  end
  factory :area do
    description     "Example Area"
    identifier      "Area Identifier"  
  end
  trait :has_area do
    before :create do |doc_type|
      FactoryGirl.create_list :area, 1, :doc_type => doc_type
    end
  end
  trait :has_doc_type do
    before :create do |document|
      FactoryGirl.create :doc_type
      FactoryGirl.create :area
    end
  end
end
FactoryGirl.create :document, :has_doc_type
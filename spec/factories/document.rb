include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    first_name  "John"
    last_name   "Doe"
    admin       false
    email       "johnd@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
  factory :admin, class: User do
    first_name  "Admin"
    last_name   "User"
    admin       true
    email       "administrator@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
  factory :document do
    name            "Example Document"
    permit_number   "12345 Permit Number"
    expiration_date Date.today + 100.days
    user_id         1
    doc_type_id     1
    #document_upload { fixture_file_upload(Rails.root.join('spec', 'factories', 'pdf-sample.pdf'), 'pdf') }
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
      FactoryGirl.create :area, :doc_type => doc_type
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
include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    first_name  "John"
    last_name   "Doe"
    type        "ClientSite"
    email       "johnd@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
  factory :admin, class: Admin do
    first_name  "Admin"
    last_name   "User"
    type        "Admin"
    email       "administrator@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
    factory :client_manager, class: ClientManager do
    first_name  "Client"
    last_name   "Manager"
    type        "ClientManager"
    email       "clientmanager@example.com"
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
factory :permit_expire_alert do

end

  factory :area do
    description     "Example Area"
    identifier      "Area Identifier"  
  end
  factory :account do
    name            "Example Company"
    subdomain       "exampleco"
    client_manager  FactoryGirl.create(:client_manager)
  end
  factory :doc_category do
    name       "Example Doc Type"
    account_id        FactoryGirl.create(:account)
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
#FactoryGirl.create :document, :has_doc_type
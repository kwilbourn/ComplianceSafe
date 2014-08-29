FactoryGirl.define do
  factory :user do
    first_name  "John"
    last_name   "Doe"
    admin       false
    email       "john@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
  factory :admin, class: User do
    first_name  "Admin"
    last_name   "User"
    admin       true
    email       "admin@example.com"
    password    "changeme"
    password_confirmation "changeme"
  end
end
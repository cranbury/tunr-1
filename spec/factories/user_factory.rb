FactoryGirl.define do
  factory :user do
    email                  "j@k.co" 
    balance                4.0 
    first_name             "Jeff"
    last_name              "K"
    dob                    Date.today
    password               "shmee"
    password_confirmation  "shmee"
  end

  factory :shared_with, class: User do
    email                  "g@a.co" 
    balance                4.0 
    first_name             "G"
    last_name              "A"
    dob                    Date.today
    password               "shmee"
    password_confirmation  "shmee"
  end

  factory :not_shared_with, class: User do
    email                  "j@s.co" 
    balance                4.0 
    first_name             "J"
    last_name              "S"
    dob                    Date.today
    password               "shmee"
    password_confirmation  "shmee"
  end
end

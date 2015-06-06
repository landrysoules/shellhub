FactoryGirl.define do
  factory :snipet do
    title "My first snipet"
    content "ls ~"
    execution_output "MyString"
    user
  end
end

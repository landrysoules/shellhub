FactoryGirl.define do
  factory :snipet do
    title "My first snipet"
    content "ls ~"
    execution_output "MyString"
    user
    
    factory :snipet_invalid do
      title "a"
      content "a"
    end

  end
end

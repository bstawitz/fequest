FactoryGirl.define do
  factory :comment do
    body "This feature is great!"
    feature
    upvotes {rand(1..10)}
    downvotes {rand(1..10)}
  end
end

Rails.application.routes.draw do
  get 'mocks/features', to: "mocks#features", as: :features

  get 'mocks/feature', to: "mocks#feature", as: :feature

  get 'mocks/admin', to: "mocks#admin", as: :admin

  root 'statics#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

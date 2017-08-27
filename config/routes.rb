Rails.application.routes.draw do

  resources :features
  post 'new_comment', to: "comments#ajax_create", as: :comments
  delete 'delete_comment/:id', to: "comments#ajax_delete", as: :delete_comment
  post 'feature/vote', to: "features#vote", as: :feature_vote

  root 'features#index'

  # MOCKUPS
  get 'mocks/features', to: "mocks#features", as: :mock_features
  get 'mocks/feature', to: "mocks#feature", as: :mock_feature
  get 'mocks/new_feature', to: "mocks#new_feature", as: :mock_new_feature
  get 'mocks/admin', to: "mocks#admin", as: :mock_admin
  get 'mocks/profile', to: "mocks#profile", as: :mock_profile
end

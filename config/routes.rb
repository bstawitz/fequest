Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/, defaults: {locale: "en"} do
    devise_for :users
    resources :features
    resources :comments, only: [:create, :destroy]

    post 'feature/vote', to: "features#vote", as: :feature_vote

    root 'features#index'

    # MOCKUPS
    get 'mocks/features', to: "mocks#features", as: :mock_features
    get 'mocks/feature', to: "mocks#feature", as: :mock_feature
    get 'mocks/new_feature', to: "mocks#new_feature", as: :mock_new_feature
    get 'mocks/admin', to: "mocks#admin", as: :mock_admin
    get 'mocks/profile', to: "mocks#profile", as: :mock_profile
  end
end

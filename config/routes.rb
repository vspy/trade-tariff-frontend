Uktt::Application.routes.draw do
  match "/search" => "search#search", via: :post, as: :perform_search

  resources :sections, only: [:index]  do
    resources :chapters, only: [:index] do
      resources :commodities, only: [:index]
    end
  end

  root to: 'search#show'
end

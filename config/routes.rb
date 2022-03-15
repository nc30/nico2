Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "events#index"
  get 'events/new', to: 'events#new'

  resources :events, only: [:show, :create, :update] do
    get 'entry', to: 'events#entry'
    get 'kanji', to: 'events#kanji'
    post 'login', to: 'events#login'

    resources :entries, only: [:index, :show, :create, :update] do
      get 'edit', to: 'entries#edit'
    end
  end
end

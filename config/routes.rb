Rails.application.routes.draw do

  resources :visitormailers

  scope "(:locale)" do
    resources :reports
    root to: 'welcome#index'
  end

end


Rails.application.routes.draw do
  get 'users/new'

  get 'static_pages/top'

  root 'static_pages#top'

  
end

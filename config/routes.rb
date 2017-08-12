Rails.application.routes.draw do
	# All of the welcome routes
	root "welcome#index"

	get '/index', to: 'welcome#index', as: 'index'
	get '/info', to: 'welcome#info', as: 'info'
	get '/terms', to: 'welcome#terms', as: 'terms'

	#All of the members routes
	resources :members

	get '/new', to: 'members#new', as: 'new'
	get '/signuplogin', to: 'members#signuplogin', as: 'signuplogin'
end


# Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           welcome#index
#       index GET    /index(.:format)            welcome#index
#        info GET    /info(.:format)             welcome#info
#       terms GET    /terms(.:format)            welcome#terms

#     members GET    /members(.:format)          members#index
#             POST   /members(.:format)          members#create
#  new_member GET    /members/new(.:format)      members#new
# edit_member GET    /members/:id/edit(.:format) members#edit
#      member GET    /members/:id(.:format)      members#show
#             PATCH  /members/:id(.:format)      members#update
#             PUT    /members/:id(.:format)      members#update
#             DELETE /members/:id(.:format)      members#destroy
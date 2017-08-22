Rails.application.routes.draw do
	# All of the welcome routes
	root "welcome#index"

	# get '/welcome/index', to: 'welcome#index', as: 'index'
	# get '/welcome', to: 'welcome#index', as: 'index'
	# get '/index', to: 'welcome#index', as: 'index'
	get '/info', to: 'welcome#info', as: 'info'
	get '/terms', to: 'welcome#terms', as: 'terms'

	#All of the members routes
	resources :members

	get '/new', to: 'members#new', as: 'new'
	get '/rookie', to: 'members#rookie', as: 'rookie'
	get '/signuplogin', to: 'members#signuplogin', as: 'signuplogin'
end

#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           welcome#index
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
#         new GET    /new(.:format)              members#new
#      rookie GET    /rookie(.:format)           members#rookie
# signuplogin GET    /signuplogin(.:format)      members#signuplogin
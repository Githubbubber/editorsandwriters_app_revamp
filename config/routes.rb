Rails.application.routes.draw do
  	get 'sessions/new'

	# All of the welcome routes
	root "welcome#index"

	# get '/welcome/index', to: 'welcome#index', as: 'index'
	# get '/welcome', to: 'welcome#index', as: 'index'
	# get '/index', to: 'welcome#index', as: 'index'
	get '/info', 		to: 'welcome#info', as: 'info'
	get '/terms', 		to: 'welcome#terms', as: 'terms'

	#All of the members routes
	resources :members do
		resources :ratings
	end

	# get 'login', 		to: 'sessions#new'
	# get 'login', 		to: 'sessions#create'
	match 'login', 		to: 'sessions#new', via: [:get]
	match 'login', 		to: 'sessions#create', via: [:post]
	get 'logout', 		to: 'sessions#destroy', as: 'logout'
	get '/new', 		to: 'members#new', as: 'new'
	get '/rookie', 		to: 'members#rookie', as: 'rookie'
	get '/signuplogin', to: 'members#signuplogin', as: 'signuplogin'
end

#             Prefix Verb   URI Pattern                                    Controller#Action
#       sessions_new GET    /sessions/new(.:format)                        sessions#new
#               root GET    /                                              welcome#index
#               info GET    /info(.:format)                                welcome#info
#              terms GET    /terms(.:format)                               welcome#terms
#     member_ratings GET    /members/:member_id/ratings(.:format)          ratings#index
#                    POST   /members/:member_id/ratings(.:format)          ratings#create
#  new_member_rating GET    /members/:member_id/ratings/new(.:format)      ratings#new
# edit_member_rating GET    /members/:member_id/ratings/:id/edit(.:format) ratings#edit
#      member_rating GET    /members/:member_id/ratings/:id(.:format)      ratings#show
#                    PATCH  /members/:member_id/ratings/:id(.:format)      ratings#update
#                    PUT    /members/:member_id/ratings/:id(.:format)      ratings#update
#                    DELETE /members/:member_id/ratings/:id(.:format)      ratings#destroy
#            members GET    /members(.:format)                             members#index
#                    POST   /members(.:format)                             members#create
#         new_member GET    /members/new(.:format)                         members#new
#        edit_member GET    /members/:id/edit(.:format)                    members#edit
#             member GET    /members/:id(.:format)                         members#show
#                    PATCH  /members/:id(.:format)                         members#update
#                    PUT    /members/:id(.:format)                         members#update
#                    DELETE /members/:id(.:format)                         members#destroy
#              login GET    /login(.:format)                               sessions#new
#                    GET    /login(.:format)                               sessions#create
#             logout GET    /logout(.:format)                              sessions#destroy
#                new GET    /new(.:format)                                 members#new
#             rookie GET    /rookie(.:format)                              members#rookie
#        signuplogin GET    /signuplogin(.:format)                         members#signuplogin
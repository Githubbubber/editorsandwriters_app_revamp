# Editors & Writers (will be renamed upon completion)
***
Editors & Writers is a professional social network of writers and editors of color in the comics industry. 

## Interface
* Comic book-inspired visuals to the design
* Users who haven't signed up yet can only see the home, signup/login, and terms pages
* Signed in members will have video chat and instant messaging on the personal member page
* General members page will have large central search area with various filters: alter ego, genre, ratings, reviews

## Motivation
There is a need for these skilled professionals to build on connections with each other, learning from each other and gaining valuable insights into how to bring comics to the next level.

## Installation
* Versions during the initial development period:
  * Ruby version 2.4.1 [x86_64-darwin16]
  * Rails 5.1.3
  * Bundler 1.15.3
  * Developed on a macOS Sierra, v. 10.12.6
* APIs and third party tools used (outside of imported ones through RoR):
  * Gravatar for avatar use
  * Ziggeo for video chat
  * Drop down list of colleges, universities, and vocational schools in the US+
  * Drop down list for cities and states of the US+
  * Inspirational quote generator for tagline and advice inputs

Make sure that you have Git, Rails, and Bundler installed. Clone the app locally, and save that version in Git right away. The run the app by entering 'rails s' to see if it works. If it does you are on your way! If not... Well... Search for the same error on Stackoverflow, and keep trying. If all else fails send me a msg.

## Development
* Initial migrations run in the following order:
  * rails generate controller Welcome index info signuplogin terms
  * rails generate model Member acct_type:string{1} first_name:string{20} last_name:string{20} alter_ego:string{20}:uniq password_digest:string{20} email:string:uniq tagline:string{160} aboutme:text{320} avatar:string location:string fav_style_manual:string education:string fav_advice:string{160}  
  * rails generate model Genre member:references user_added:boolean genre:string{20} 
  * rails generate model Review member:references reviewer_id:integer review_body:text{160}
  * rails generate model Rating member:references rater_id:integer rating:integer{1} 

## Common user (not logged in) and member (logged in) nagivation scenarios
```
  A user is browsing:
    /welcome/index & /welcome/info & /welcome/terms & /members/signuplogin
  A user is contacting the webmaster
    Footer has link to Gifted Sites 
  A user is signing up: 
    client: /welcome/index -> /members/signuplogin -> /welcome#info
    server: welcome#index -> members#new -> /members#create -> welcome#info
  A member is logged in and wants to see their profile:
    client: /members -> /members/:id
    server: members#index -> members#show
  A member wants to edit their profile info:
    client: /members/:id -> /members/:id/edit -> /members
    server: members#show -> members#edit -> members#update -> members#index
  A member wants to delete their profile
    client: /members/:id -> /members/:id -> welcome/index
    server: members#show -> members#destroy -> welcome#index
```

## Member and Welcome model's routes
```
        Prefix Verb   URI Pattern                 Controller#Action
          root GET    /                           welcome#index
          info GET    /info(.:format)             welcome#info
         terms GET    /terms(.:format)            welcome#terms
       members GET    /members(.:format)          members#index
               POST   /members(.:format)          members#create
    new_member GET    /members/new(.:format)      members#new
   edit_member GET    /members/:id/edit(.:format) members#edit
        member GET    /members/:id(.:format)      members#show
               PATCH  /members/:id(.:format)      members#update
               PUT    /members/:id(.:format)      members#update
               DELETE /members/:id(.:format)      members#destroy
           new GET    /new(.:format)              members#new
        rookie GET    /rookie(.:format)           members#rookie
   signuplogin GET    /signuplogin(.:format)      members#signuplogin
```


## Frustrations, questions, and moments of confusion
- How am I to handle the editing of key model values? Ex, since the username is unique, should I make it a primary key? Should members be able to change their username or should I make them delete their profile if they want to do that?
- Is PostgresQL better for this app in the long run?

## Authors: Mekesia Brown

## License
TBD

## README info to be added:
Document whatever steps are necessary to get the application up and running.
Things you may want to cover:
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
require 'sinatra'

class App < Sinatra::Base   #inherit all of the Sinatra Base methods into our App class
  #Basic routing

  # get '/hello' do   #this routing method is known as a DSL (Domain-Specific Language).  It allows us to define routes in our class
  #                   #wheneven the path is set to /hello, this method is called.  The GET ask for the block of data, the response this below.
  #   '<h2>Hello <em>World</em>!</h2>'
  # end

  # get '/potato' do
  #   "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  # end
  #=======================================================================================
  #Getting fancy; interpolating random numbers into HTML
  # get '/dice' do
  #   dice_roll = rand(1..6)
  #   "<h2>You rolled a #{dice_roll}</h2>"
  # end

  #Setting default content types, set a random number to a variable, call that variable and run through .to_json method to convert to JSON data
  # Add this line to set the Content-Type header for all responses
  # set :default_content_type, 'application/json'

  # get '/dice' do
  #   dice_roll = rand(1..6)
  #   { roll: dice_roll }.to_json
  # end

  #========================================================================================
  #Dynamic Routes
  #this is not very dynamic, it's fixed and only works with 1 & 2
  # get '/add/1/2' do
  #   sum = 1 + 2
  #   { result: sum}.to_json
  # end

  #Instead, we use "named parameters"; which are variables to set to the data in the URL.  These special variables are known as the "params hash".
    #Basically, we get to pass special arguments to the route handler: EX: GET /add/1/2  =>  {"num1"=>"1", "num2"=>"2"} as a params hash.
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    {result: sum }.to_json
  end
end

run App

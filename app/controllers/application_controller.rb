require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do

    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"])

    if !!@user == true && @user.password == params["password"]
      session[:user_id] = @user.id
       redirect to '/account'
    else
      erb :error
    end

  end

  get '/account' do

<<<<<<< HEAD
   if Helpers.is_logged_in?(session)
     erb :account
   else
      erb :error
   end
=======
    @user = User.find(session[:user_id])
  if !@user
      erb :error
    elsif
      erb :account
    else
      erb :error
      end
>>>>>>> ccf91d547ce18e4953bbb530633f33b374c5d3b1
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

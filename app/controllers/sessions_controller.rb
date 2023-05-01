class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by_email(params[:email])
      puts "User: #{user.inspect}"

      if user && user.authenticate(params[:password])
         # Log the user in and redirect to the user's show page.
        session[:user_id] = user.id
        puts "Session: #{session.inspect}"

        redirect_to root_url, notice: "Logged in!"
      else
        # Create an error message.
        flash.now[:alert] = "Invalid email or password"
        render "new"
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end

  end
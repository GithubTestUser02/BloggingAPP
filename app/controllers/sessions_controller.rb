class SessionsController < ApplicationController

    def new
    end

    def create
        user=User.find_by(username: params[:session][:username])
        if(user && user.authenticate(params[:session][:password]))
            session[:user_id]=user.id
            flash[:notice]="User Logged In Successfully"
            redirect_to user_path(user)
        else
            flash.now[:alert]="There was something wrong with your login details"
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id]=nil
        flash[:notice]="Logged Out Successfully"
        redirect_to root_path, status: 303
    end
end
class UsersController < ApplicationController
     
    before_action :set_user,only:[:edit,:update,:show,:destroy]

    def show
        @articles=@user.articles
    end

    def index
        @users=User.all
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            flash[:notice]="User signed up successfully"
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice]="User Info Updated Successfully"
            redirect_to users_path
        else
            render :edit,status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        flash[:notice]="User Deleted Successfully"
        redirect_to users_path
    end

    private

    def set_user
        @user=User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end
end
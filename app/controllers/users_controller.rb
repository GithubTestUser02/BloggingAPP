class UsersController < ApplicationController
     
    before_action :set_user,only:[:edit,:update,:show,:destroy]
    before_action :require_user, except:[:index,:show,:new,:create]
    before_action :require_same_user, except:[:index,:show,:new,:create]

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
            session[:user_id]=@user.id
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
        session[:user_id]=nil
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

    def require_same_user
        if current_user!=@user && !current_user.admin?
            flash[:alert]="You can edit or delete your own account"
            redirect_to @user
        end
    end
end
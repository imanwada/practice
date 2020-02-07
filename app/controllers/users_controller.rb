class UsersController < ApplicationController
    def register
        render 'signup'
    end

    def create
        @user = User.new(user_params)
        if (@user.save)
            redirect_to login_users_path
        else
            render 'signup'
        end
    end

    def login
    end

    def process_login
        @user = User.find_by_email(user_params[:email])
        # render plain: @user.inspect
        if @user and @user.authenticate(user_params[:password])
            session[:logged_in] = true
            session[:email] = user_params[:email]
            session[:id] = @user[:id]
            redirect_to dashboard_users_path, :flash => { :success => "You are logged in successfully as #{session[:email]}" }
        else
            # render plain: user_params
            if user_params[:email] == "" and user_params[:password] == ""
                flash[:error] = "Please Provide Email And Password"
            elsif user_params[:email] == ""
                flash[:error] = "Please Provide Email Address"
            elsif user_params[:password] == ""
                flash[:error] = "Please Provide Password"
            elsif @user == nil
                flash[:error] = "Incorrect Email Provided"
            elsif @user != nil and @user[:email] != ""
                flash[:error] = "Incorrect Password Provided"
            else
                flash[:error] = "Please Provide Correct Email And Password"
            end
            render 'login'
        end
    end

    def dashboard 
        @user = User.find_by_email(session[:email])
    end
   def show
    redirect_to login_users_path
   end
    def logout
        session[:email] = nil
        #session.clear 
    end

    #def edit
        #@user.update_attributes(user_params)
    #end
    private
        def user_params
            params.require(:user).permit(:fullname, :email, :password)
        end
end

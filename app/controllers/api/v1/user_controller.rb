module Api
  module V1
    class UserController < V1Controller
    def email
    end

    def password
    end

    def create
      # Create the user from params
      @user = User.new(user_params)
      if @user.save
        # Deliver the signup email
        UserNotifierMailer.send_signup_email(@user).deliver
        redirect_to(@user, :notice => 'User created')
      else
        render :action => 'new'
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end

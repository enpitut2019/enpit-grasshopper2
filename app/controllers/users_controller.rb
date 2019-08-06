<<<<<<< HEAD
class UsersController < ApplicationController
  # GET /users/:id
  def show
    #@user = User.find(params[:id])
    #=> app/views/users/show.html.erb
    # debugger
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save # => Validation
      # Success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to '/home'
      #redirect_to "/profile/#{@user.id}/edit"
      # GET "/users/#{@user.id}" => show
    else
      flash[:failure] = "fail"
      # Failure
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
=======
class UsersController < ApplicationController
  # GET /users/:id
  def show
    #@user = User.find(params[:id])
    #=> app/views/users/show.html.erb
    # debugger
  end

  def new
    @user = User.new
    @user.build_profile
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save # => Validation
      # Success
      log_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to '/home'
      #redirect_to "/profile/#{@user.id}/edit"
      # GET "/users/#{@user.id}" => show
    else
      flash[:failure] = "fail"
      # Failure
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, profile_attributes:[:goal, :daily_task])
  end


end
>>>>>>> f48a94cb67ef6cbae77fff5bc232a8023c38e3f1

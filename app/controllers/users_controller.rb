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
    @user.tag.build

  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save # => Validation
      # Success
      log_in(@user)
      flash[:success] = "はじめまして！僕はあなたのアバター！僕をクリックして早速今日の記録をしてみよう！"
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
    params.require(:user).permit(:name, :email, :password, profile_attributes:[:goal, :daily_task], tag_attributes:[:tag], tag_attributes:[:tag], tag_attributes:[:tag])
  end


end

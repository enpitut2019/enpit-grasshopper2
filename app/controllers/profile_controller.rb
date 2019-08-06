class ProfileController < ApplicationController
  layout 'contents'
  
  def new
    @profile=Profile.new
  end

  def show
    @avatar_name="太郎"
    @level=1
    @exp=get_exp(1)
    @comment="頑張る"
    @icon="/assets/卵.png"
    @icon2="/assets/ひよこ.png"
    @count=1
    @current_profile=Profile.find_by(user_id: current_user[:id])
    @days = Record.where(user_id: current_user[:id])
    array=[]
    i=0
    @days.each do |day|
      array[i] = day.created_at.strftime('%Y-%m-%d')
      i=i+1;
    end
    gon.days = array
  end

  def edit
    @profile=Profile.find(params[:id])
  end

  def set_record
    #@current_profile[:user_id]=current_user[:id]
    @record=Record.new(user_id: current_user[:id])
    if @record.save
      redirect_to '/record'
    else
      redirect_to '/home'
    end
  end

  def update
    @current_profile=Profile.find_by(user_id: current_user[:id])
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      # 更新に成功した場合を扱う。
      redirect_to @current_profile
    else
      render 'edit'
    end
  end

  def record_memo
    @memo=Memo.new(memo_params)
    if @memo.save # => Validation
      # Success
      redirect_to '/rank'
    else
      flash[:failure] = "fail"
      # Failure
      render '#'
    end
  end

  def profile_params
    params.require(:profile).permit(:goal,:daily_task)
  end

  def memo_params
    params.require(:memo).permit(:memo)
  end

  def get_exp(login_user_id)
    user_profile = Profile.find_by(user_id: login_user_id)
    print("user exp = ", user_profile[:experience])
    return user_profile[:experience]
  end
end

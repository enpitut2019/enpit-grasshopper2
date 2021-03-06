class ProfileController < ApplicationController
  layout 'contents'
  
  def new
    @profile=Profile.new
  end

  def show
    @avatar_name="太郎"
    @exp=get_exp(1)
    @comment="頑張る"
    @count=1
    @current_profile=Profile.find_by(user_id: current_user[:id])
    @level=@current_profile.get_level
    @avatar=@current_profile.get_avatar
    @days = Record.where(user_id: current_user[:id])
    if !flash[:success]
      flash[:notice] = "今日のタスクを達成したら僕をクリックしてね"
    else
      flash[:notice] = ''
    end

    
    array=[]
    i=0
    @days.each do |day|
      array[i] = day.created_at.strftime('%Y-%m-%d')
      i=i+1;
    end
    gon.days = array
  end

  def edit
    check_correct_user
    @profile=Profile.find(params[:id])
  end
  
  def set_record
    @days = Record.where(user_id: current_user[:id]).order(created_at: 'DESC')
    record = @days.find_by(user_id: current_user[:id])
    @latest_date = record ? record.created_at.strftime('%Y-%m-%d').to_s : nil

    if @latest_date && @latest_date == Time.now.strftime('%Y-%m-%d').to_s
      redirect_to '/home'
      flash[:success] = "今日のタスクは完了してるよ！明日も頑張ろう！！<br>メモの記入がまだだったらメモしよう！ <a href='/record'>あなたの記録へ</a>"
      flash[:notice] = ''
    else
      @profile=Profile.find(current_user[:id])
      #@current_profile[:user_id]=current_user[:id]
      @record=Record.new(user_id: current_user[:id])
      @profile.experience += 1000
      if @record.save && @profile.save
        flash[:success] = "今日の記録を保存したよ！頑張ってて偉いね！！"
        flash[:notice] = ''
        redirect_to '/record'
      else
        redirect_to '/record'
      end
    end
  end
  def check_correct_user 
    if current_user[:id] !=  params[:id].to_i
      redirect_to("/home")
      flash[:link_error]="Error! 無効なアドレスです"
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
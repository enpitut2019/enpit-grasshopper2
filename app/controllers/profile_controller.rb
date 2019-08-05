class ProfileController < ApplicationController
  layout 'contents'
  
  def show
    @avatar_name="太郎"
    @level=1
    @exp=get_exp(1)
    @comment="頑張る"
    @icon="/assets/卵.png"
    @icon2="/assets/ひよこ.png"
    @count=1
    #profile=Profile.find_by(id: current_user[:id])
  end

  def get_exp(login_user_id)
    user_profile = Profile.find_by(user_id: login_user_id)
    print("user exp = ", user_profile[:experience])
    return user_profile[:experience]
  end
end

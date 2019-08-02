class ProfileController < ApplicationController
  def show
    @avatar_name="太郎"
    @level=1
    @exp=get_exp(1)
    @comment="頑張る"
    @icon="assets/a.jpg"
    @icon2="assets/b.jpg"
    @count=1
  end

  def get_exp(login_user_id)
    user_profile = Profile.find_by(user_id: login_user_id)
    puts user_profile[:experience]
    return user_profile[:experience]
  end
end

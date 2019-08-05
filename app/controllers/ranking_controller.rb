class RankingController < ApplicationController
  layout 'contents'
  
  def show
    ranking_info = []

    users = User.all
    for user in users do
      profile = Profile.find_by(user_id: user.id)
      print profile
      rank_data = {
        id:user.id,
        name:user.name,
        icon: profile.avatar_url,
        score: profile.monthly_score,
        daily_task: profile.daily_task,
        goal: profile.goal
      }
      ranking_info.push(rank_data)
    end
    @tags = ['筋トレ', 'ガチ', '茨城']
    @users = ranking_info
    @myId = current_user[:id]
    @myName = current_user[:name]
    @myIcon = 'a.png'
    @myScore = 10304
  end
end
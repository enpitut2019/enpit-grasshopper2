require 'set'

class RankingController < ApplicationController
  layout 'contents'

  def show
    ranking_info = []
    ar_my_tags = Tag.where(user_id: current_user[:id].to_s)
    @tags = []
    for ar_my_tag in ar_my_tags do
      @tags.push(ar_my_tag.tag)
    end
    @selected_tags = @tags.dup
    if params[:exclude] != nil then
      for tag in params[:exclude].values do
        @selected_tags.delete(tag)
      end
    end

    users_id = get_users_by_and_tag(@selected_tags)
    @users = get_ranking_data(users_id)  # 最初はログインユーザのタグを持つユーザすべてでランキング
    @myId = current_user[:id]
    @myName = current_user[:name]
    @myIcon = 'a.png'
    @myScore = 10304
  end

  def update_users(tags)
    @users = get_users_by_and_tag(@tags)  # 最初はログインユーザのタグを持つユーザすべてでランキング
  end

  def get_ranking_data(users_id)
    ranking_info = []
    # user has many profile の関係の場合 joins(:profiles) で内部結合
    users = User.where(id: users_id).joins(:profile).order("experience DESC")
    
    for user in users do
      profile = Profile.find_by(user_id: user.id)
      print profile
      rank_data = {
        id:user.id,
        name:user.name,
        icon: profile.avatar_url,
        score: profile.experience,
        daily_task: profile.daily_task,
        goal: profile.goal,
        avatar: profile.get_avatar
      }
      ranking_info.push(rank_data)
    end
    return ranking_info
  end

  def get_users_by_or_tag(selected_tags)
    common_tag = []
    common_users = Set.new()
    for selected_tag in selected_tags do
      same_tags = Tag.where(tag: selected_tag)
      for tag in same_tags do
        common_users.add(tag.user_id)
      end
    end
    return common_users
  end

  def get_users_by_and_tag(selected_tags)
    common_users = Set.new()
    
    cnt = 0
    for selected_tag in selected_tags do
      same_tags = Tag.where(tag: selected_tag)
      
      if cnt == 0 then
        for tag in same_tags do
          common_users.add(tag.user_id)
        end
      else
        users_set = Set.new()
        for tag in same_tags do
          users_set.add(tag.user_id)
        end
        common_users = common_users & users_set
      end
      cnt += 1
    end
    return common_users
  end
end
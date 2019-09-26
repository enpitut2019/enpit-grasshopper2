class MemoController < ApplicationController
  layout 'contents'

  def new
    @memo = Memo.new
    @record_id = params[:record_id]
  end

  def show
    #
    @ar_my_tags = Tag.where(user_id: current_user[:id].to_s)
    @tags = []
    for ar_my_tag in @ar_my_tags do
      @tags.push(ar_my_tag.tag)
    end
    @selected_tags = @tags.dup
    if params[:exclude] != nil then
      for tag in params[:exclude].values do
        @selected_tags.delete(tag)
      end
    end
    users_id = get_users_by_and_tag(@selected_tags)
    #ここまでrankingから移植
    @users = User.all
    @tag_users=User.where(id: users_id).joins(:profile).order("experience DESC")
    @profiles = Profile.all
    @tag_all=Tag.all
    @records = Record.all.order(created_at: "DESC")
    @current_profile = Profile.find_by(user_id: current_user[:id])
    @memos = Memo.all
    #@profiles = Profile.where(id: @users[:id])
  end

  def create
    #@current_record=Record.find_by[:user_id current_user[:id]]
    @records = Record.all
    ## TODO: view で 自分のID一致するものを判定する処理を消し以下を適応
    # @records = Record.where(user_id: current_user[:id])
    @rid = params[:memos][:record_id] #(@records.length+1)
    p "debug lgoo ------\n\n\n"
    p params
    p params[:memos][:record_id]
    p "debug lgoo ------"
    @memo = Memo.new(memo: params[:memos][:memo],like_count: 0, record_id: @rid)
    
    if @memo.save # => Validation
      # Success
      redirect_to '/record'
      #redirect_to "/profile/#{@user.id}/edit"
      # GET "/users/#{@user.id}" => show
    else
      flash[:failure] = "fail"
      # Failure
      render 'new'
    end
  end

  def memo_params
    params.require(:memo).permit(:memo)
  end

  #ここからrankingから移植
  def update_users(tags)
    @users = get_users_by_and_tag(@tags)  # 最初はログインユーザのタグを持つユーザすべてでランキング
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


#    @items = Item.select('word, count, created_at').order(created_at: :desc).order(count: :desc).group(:word, :count, :created_at).limit(30)

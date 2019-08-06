class MemoController < ApplicationController
  layout 'contents'

  def new
    @memo=Memo.new
    p "check."
    p params[:user_id]
    p params[:record_id]
    p "check."
  end

  def show
    @users = User.all.order(id: "ASC")
    @profiles = Profile.all
    @tags = Tag.all
    @records = Record.all
    @memos = Memo.all
    #@profiles = Profile.where(id: @users[:id])
  end

  def create
    #@current_record=Record.find_by[:user_id current_user[:id]]
    @records = Record.all
    ## TODO: view で 自分のID一致するものを判定する処理を消し以下を適応
    # @records = Record.where(user_id: current_user[:id])
    @rid = (@records.length+1)

    @memo = Memo.new(memo: params[:memos][:memo],like_count: 0,record_id: @rid)
    
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
end


#    @items = Item.select('word, count, created_at').order(created_at: :desc).order(count: :desc).group(:word, :count, :created_at).limit(30)

class MemoController < ApplicationController
  layout 'contents'

  def new
    @memo = Memo.new
    @record_id = params[:record_id]
  end

  def show
    @users = User.all
    @profiles = Profile.all
    @tags = Tag.all
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
    @rid = params[:record_id]  #(@records.length+1)
    p "debug lgoo ------\n\n\n"
    p params[:recird_id] 
    p "debug lgoo ------"
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

class MemoController < ApplicationController
  layout 'contents'

  def show
    @users = User.all.order(id: "ASC")
    @profiles = Profile.all
    @tags = Tag.all
    @records = Record.all
    @memos = Memo.all

    #@profiles = Profile.where(id: @users[:id])

  end
end


#    @items = Item.select('word, count, created_at').order(created_at: :desc).order(count: :desc).group(:word, :count, :created_at).limit(30)

class RecordController < ApplicationController
  layout 'contents'
  def show
    @days = Record.where(user_id: current_user[:id])
    array=[]
    i=0
    @days.each do |day|
      array[i] = day.created_at.strftime('%Y-%m-%d')
      i=i+1;
    end
    gon.days = array

    @current_profile=Profile.find_by(user_id: current_user[:id])
    @records=Record.where(user_id: current_user[:id]).order(created_at: "DESC")
    @memos = Memo.all
  end
end

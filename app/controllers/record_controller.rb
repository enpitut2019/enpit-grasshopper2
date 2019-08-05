class RecordController < ApplicationController
  layout 'contents'
  
  def show
    
    @current_profile=Profile.find_by(user_id: current_user[:id])
    @records=Record.where(user_id: current_user[:id])
    @memos = Memo.all
  end
end

class RankingController < ApplicationController
  def show
    @users = [ { id: 1, name: '太郎', icon: 'a.png' }, { id: 2, name: '次郎', icon: 'b.png' }, { id: 3, name: '三郎', icon: 'c.png' } ]
  end
end

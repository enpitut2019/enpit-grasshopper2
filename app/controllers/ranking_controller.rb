class RankingController < ApplicationController
  def show
    @users = [
      { id: 1, name: '太郎', icon: '/assets/a.jpg', score: 10000 },
      { id: 2, name: '次郎', icon: '/assets/b.jpg', score: 9000 },
      { id: 3, name: '三郎', icon: '/assets/c.jpg', score: 3 }
    ]
    @myId = 1
    @myName = '太郎'
    @myIcon = 'a.png'
    @myScore = 10000
  end
end

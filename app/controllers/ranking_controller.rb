class RankingController < ApplicationController
  layout 'contents'
  
  def show
    @users = [
      { id: 1, name: '太郎', icon: '/assets/a.jpg', score: 10304 },
      { id: 2, name: '次郎', icon: '/assets/b.jpg', score: 9070 },
      { id: 3, name: '三郎', icon: '/assets/c.jpg', score: 8121 },
      { id: 4, name: '七郎', icon: '/assets/a.jpg', score: 8012 },
      { id: 5, name: '四郎', icon: '/assets/b.jpg', score: 7842 },
      { id: 6, name: '五郎', icon: '/assets/c.jpg', score: 6731 },
      { id: 7, name: '六郎', icon: '/assets/a.jpg', score: 6730 },
      { id: 8, name: '八郎', icon: '/assets/b.jpg', score: 6400 },
      { id: 9, name: '九郎', icon: '/assets/c.jpg', score: 3012 },
      { id: 10, name: '十浪', icon: '/assets/a.jpg', score: 2057 },
      { id: 11, name: '重一郎', icon: '/assets/b.jpg', score: 1203 },
      { id: 12, name: '十二郎', icon: '/assets/c.jpg', score: 3 }
    ]
    @myId = 1
    @myName = '太郎'
    @myIcon = 'a.png'
    @myScore = 10304
  end
end

# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:id => 1, :name => '山田', :email => 'yamada@gmail.com', :password_digest => '$2a$12$iAy0QhKyaiajc7wPFbNA6OFCsLZGXCVpKUyofNdmRKnIowWpItVeW')
User.create(:id => 2, :name => '鈴木', :email => 'suzuki@gmail.com', :password_digest => '$2a$12$ZUGVfHntOEJ3K7XsrbBUauF1M6eDML/X68DfdYomnlIPtJIP0DTEm')
User.create(:id => 3,:name => '田中', :email => 'tanaka@gmail.com', :password_digest => '$2a$12$rTcXv/cLCVFNmYaN9fbjT.6ikh05vZzTcg1JFjpDsMmhVyKaISVxe')
User.create(:id => 4,:name => 'いけぽん', :email => 'ikeda@gmail.com', :password_digest => '$2a$12$m2RYjq7VUwM.NK9jUp.1uuohO6PZaOPNsopiuhJ81.zxohMfM7QGS')
User.create(:id => 5,:name => '宇内', :email => 'unai@gmail.com', :password_digest => '$2a$12$ghwW2eORytvU9nxYvS9O0uJv3M3.cZOJRouabkTUi7fk7B1DEHAxm')

#それぞれのパスワードはnameと同値
#10.times do |i|
 #   User.create(:name => 'mob'+i.to_s, :email => 'mob'+i.to_s+'@gmail.com',
 #   :password_digest => '$2a$08$hYrPCPffh3vicHUsWwgWa.8AGwnp9awss2WFQ40k73VdL0TSW/eky')  # password は 'mob' で一意
#end

Profile.create(:user_id => '1',
:goal => '10kgやせる', :daily_task => 'ランニングする',
:monthly_score => 10, :experience => 1000,
:avatar_url => '卵.png')
Profile.create(:user_id => '2',
:goal => '筋力をつける', :daily_task => '筋トレ',
:monthly_score => 20, :experience => 2000,
:avatar_url => 'ひよこ.png')
Profile.create(:user_id => '3',
:goal => '単位を取る', :daily_task => '毎日勉強する',
:monthly_score => 30, :experience => 3000,
:avatar_url => 'ひよこ.png')
Profile.create(:user_id => '4',
:goal => 'つくばマラソン完走する', :daily_task => '毎日走りこむ',
:monthly_score => 90, :experience => 9000,
:avatar_url => 'ひよこ.png')
Profile.create(:user_id => '5',
:goal => '早起きの習慣をつける', :daily_task => '毎日五時に起きる',
:monthly_score => 40, :experience => 4000,
:avatar_url => 'ひよこ.png')

#10.times do |i|
 #   Profile.create(:user_id => (i+4).to_s,
  #  :goal => 'mob goal', :daily_task => 'mob task',
   # :monthly_score => "#{rand(10000)}", :experience => "#{rand(10000)}",
   # :avatar_url => '/a.png')
#end

Tag.create(:user_id => '1', :tag => 'ダイエット')
Tag.create(:user_id => '1', :tag => 'ランニング')
Tag.create(:user_id => '1', :tag => '主婦')

Tag.create(:user_id => '2', :tag => '筋トレ')
Tag.create(:user_id => '2', :tag => 'ラグビー')
Tag.create(:user_id => '2', :tag => 'ガチ')

Tag.create(:user_id => '3', :tag => '勉強')
Tag.create(:user_id => '3', :tag => '大学生')
Tag.create(:user_id => '3', :tag => 'ガチ')

Tag.create(:user_id => '4', :tag => 'マラソン')
Tag.create(:user_id => '4', :tag => 'ランニング')
Tag.create(:user_id => '4', :tag => '大学生')

Tag.create(:user_id => '5', :tag => 'その他')
Tag.create(:user_id => '5', :tag => 'ガチ')
Tag.create(:user_id => '5', :tag => '大学生')

#10.times do |i|
#    Tag.create(:user_id => (i+4).to_s, :tag => '夏休み')
#end

Record.create(:user_id => '1', :created_at => '2019-07-29 06:26:58 UTC')
Record.create(:user_id => '1', :created_at => '2019-07-30 06:26:58 UTC')
Record.create(:user_id => '1', :created_at => '2019-07-31 06:26:58 UTC')
Record.create(:user_id => '1', :created_at => '2019-08-01 06:26:58 UTC')
Record.create(:user_id => '1', :created_at => '2019-08-02 06:26:58 UTC')
Record.create(:user_id => '1', :created_at => '2019-08-05 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-07-11 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-07-21 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-07-31 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-08-01 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-08-03 06:26:58 UTC')
Record.create(:user_id => '2', :created_at => '2019-08-04 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-07-25 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-07-26 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-07-29 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-08-01 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-08-02 06:26:58 UTC')
Record.create(:user_id => '3', :created_at => '2019-08-05 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-07-26 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-07-27 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-07-28 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-07-29 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-07-31 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-08-01 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-08-02 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-08-03 06:26:58 UTC')
Record.create(:user_id => '4', :created_at => '2019-08-04 06:26:58 UTC')
Record.create(:user_id => '5', :created_at => '2019-08-01 06:26:58 UTC')
Record.create(:user_id => '5', :created_at => '2019-08-02 06:26:58 UTC')
Record.create(:user_id => '5', :created_at => '2019-08-04 06:26:58 UTC')
Record.create(:user_id => '5', :created_at => '2019-08-05 06:26:58 UTC')

Memo.create(:record_id => '1', :memo => 'ランニング1時間', :like_count => 10)
Memo.create(:record_id => '2', :memo => 'ランニング30分', :like_count => 1)
Memo.create(:record_id => '3', :memo => 'ランニング2時間しました。頑張りました。', :like_count => 11)
Memo.create(:record_id => '4', :memo => 'ランニング1時間', :like_count => 2)
Memo.create(:record_id => '5', :memo => 'ランニング15分。今日は早めに切り上げ', :like_count => 13)
Memo.create(:record_id => '6', :memo => 'ランニング2時間。', :like_count => 23)
Memo.create(:record_id => '7', :memo => '腹筋10回、まずはこれくらい', :like_count => 44)
Memo.create(:record_id => '8', :memo => 'スクワット50回', :like_count => 50)
Memo.create(:record_id => '9', :memo => '腕立て伏せ100回、頑張った！', :like_count => 60)
Memo.create(:record_id => '10', :memo => '腹筋100回、腹筋ついてきた気がする', :like_count => 10)
Memo.create(:record_id => '11', :memo => '腕立て伏せ200回、頑張った！', :like_count => 1)
Memo.create(:record_id => '12', :memo => '腕立て伏せ300回、キツイ', :like_count => 11)
Memo.create(:record_id => '13', :memo => '線形代数1時間、難しい', :like_count => 12)
Memo.create(:record_id => '14', :memo => '情報数学45分、眠い', :like_count => 30)
Memo.create(:record_id => '15', :memo => '情報数学2時間、チョットワカル', :like_count => 23)
Memo.create(:record_id => '16', :memo => '線形代数、3時間　全然わかんない', :like_count => 44)
Memo.create(:record_id => '17', :memo => 'TOEFLのための勉強、1時間', :like_count => 50)
Memo.create(:record_id => '18', :memo => '情報数学2時間　少しわかるようになって来た', :like_count => 60)
Memo.create(:record_id => '19', :memo => 'ランニング3km、がんばるぞ', :like_count => 10)
Memo.create(:record_id => '20', :memo => 'ランニング6km、昨日より伸びた！', :like_count => 1)
Memo.create(:record_id => '21', :memo => 'ランニング4km、疲れたなあ', :like_count => 11)
Memo.create(:record_id => '22', :memo => 'ランニング2km、もっと頑張る!', :like_count => 12)
Memo.create(:record_id => '23', :memo => 'ランニング10km、頑張った！！', :like_count => 30)
Memo.create(:record_id => '24', :memo => 'ランニング5km、疲れてしまった', :like_count => 23)
Memo.create(:record_id => '25', :memo => 'ランニング4km、そこそこかな', :like_count => 44)
Memo.create(:record_id => '26', :memo => 'ランニング12km、マラソン走り切りたい', :like_count => 50)
Memo.create(:record_id => '27', :memo => 'ランニング5km、今日は暑いなあ', :like_count => 60)
Memo.create(:record_id => '28', :memo => 'ちゃんと起きれた', :like_count => 23)
Memo.create(:record_id => '29', :memo => '起床4時半', :like_count => 44)
Memo.create(:record_id => '30', :memo => '眠い', :like_count => 50)
Memo.create(:record_id => '31', :memo => '寝そう', :like_count => 60)

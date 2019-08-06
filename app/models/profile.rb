class Profile < ApplicationRecord
  #以下はフォームからprofileにgoalとdaily_taskを登録するために設定
  belongs_to :user, :foreign_key => 'user_id', optional: true
  # belongs_to :users  # 1ユーザが複数のプロフィール(目標・経験値)を持ち場合の関係
end

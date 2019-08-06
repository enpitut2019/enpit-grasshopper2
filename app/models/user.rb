class User < ApplicationRecord
    has_secure_password validations: true
    #以下はフォームからprofileにgoalとdaily_taskを登録するために設定
    has_one :profile
    # has_many :profiles  # 1ユーザが複数のプロフィール(目標・経験値)を持ち場合の関係
    accepts_nested_attributes_for :profile

    has_many :tag
    accepts_nested_attributes_for :tag
end

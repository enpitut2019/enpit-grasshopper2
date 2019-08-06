class Profile < ApplicationRecord
  #以下はフォームからprofileにgoalとdaily_taskを登録するために設定
  belongs_to :user
end

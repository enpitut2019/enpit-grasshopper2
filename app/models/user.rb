class User < ApplicationRecord
    has_secure_password validations: true

    #以下はフォームからprofileにgoalとdaily_taskを登録するために設定
    has_one :profile
    accepts_nested_attributes_for :profile
end

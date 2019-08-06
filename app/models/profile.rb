class Profile < ApplicationRecord
    # 自身の現在のレベル。
    def get_level
        level = 1;
        while get_required_total_exp(level) <= self[:experience] do
            level += 1
        end
        return level
    end

    # 自身が次のレベルに上がるのに必要な累計経験値。
    def get_next_total_exp
        return get_required_total_exp(get_level)
    end

    private
    # levelに上がるために必要な累計経験値。
    def get_required_total_exp(level)
        total_exp = 1000
        for i in 1..(level-1) do
            total_exp += get_required_level_exp(i)
        end
        return total_exp
    end

    # levelからlevel+1に上がるために必要な経験値。
    def get_required_level_exp(level)
        return (1000 * (1.1 ** level)).to_i
    end
  #以下はフォームからprofileにgoalとdaily_taskを登録するために設定
  belongs_to :user, :foreign_key => 'user_id', optional: true
  # belongs_to :users  # 1ユーザが複数のプロフィール(目標・経験値)を持ち場合の関係
end

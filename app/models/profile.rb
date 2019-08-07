class Profile < ApplicationRecord
    # 自身の現在のレベル。
    def get_level
        level = 1;
        while get_required_total_exp(level) <= self[:experience] do
            level += 1
        end
        return level
    end

    def get_avatar
        avatar_types = [
            ["ひよこ.png", "ニワトリ.png", "ニワトリ2.png", "ニワトリ3.png"],
            ["おたまじゃくし1.png", "おたま.png", "おたまじゃくし2.png", "カエル.png"],
            ["鳥.png", "カップル2.png", "カップル3.png", "カップル4.png"],
            ["オオルリ.png", "パクツイ.png", "Firebard.png", "freeze.png"],
            ["baby1.png", "baby2.png", "baby3.png", "令和.png"],
            ["イースター1.png", "イースター2.png", "イースター3.png", "モアイ.png"],
            # [?, ?, ?, ?],
            ["パスタ.png", "ベーコン.png", "フライパン.png", "カルボナーラ.png"],
            ["おたまじゃくし1.png", "おたまじゃくし2.png", "カエル1.png", "カエル2.png"],
            ["ひよこ1.png", "ひよこ.png", "ニワトリ.png", "親子.png"],
        ]
        if get_level == 1 then
            return "/assets/卵.png"
        else
            case get_level
            when 2,3 then
                return "/assets/#{avatar_types[self[:user_id] % avatar_types.length][0]}"
            when 4,5,6 then
                return "/assets/#{avatar_types[self[:user_id] % avatar_types.length][1]}"
            when 7,8,9,10 then
                return "/assets/#{avatar_types[self[:user_id] % avatar_types.length][2]}"
            else
                return "/assets/#{avatar_types[self[:user_id] % avatar_types.length][3]}"
            end

        end
    end

    # 自身が次のレベルに上がるために必要な累計経験値。
    def get_next_required_total_exp
        return get_required_total_exp(get_level)
    end

    # 自身の現在のレベルに上がるために必要な累計経験値。
    def get_prev_required_total_exp
        return get_required_total_exp(get_level - 1)
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

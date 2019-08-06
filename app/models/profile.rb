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
        if get_level == 1 then
            return "/assets/卵.png"
        else
            case self[:user_id] % 5
            when 0 then
                case get_level
                when 2 then
                    return "/assets/ひよこ.png"
                when 3 then
                    return "/assets/ニワトリ.png"
                when 4 then
                    return "/assets/ニワトリ2.png"
                else
                    return "/assets/ニワトリ3.png"
                end

            when 1 then
                case get_level
                when 2 then
                    return "/assets/おたまじゃくし1.png"
                when 3 then
                    return "/assets/おたま.png"
                when 4 then
                    return "/assets/おたまじゃくし2.png"
                else
                    return "/assets/カエル.png"
                end

            when 2 then
                case get_level
                when 2 then
                    return "/assets/カップル1.png"
                when 3 then
                    return "/assets/カップル2.png"
                when 4 then
                    return "/assets/カップル3.png"
                else
                    return "/assets/カップル4.png"
                end

            when 3 then
                case get_level
                when 2 then
                    return "/assets/オオルリ.png"
                when 3 then
                    return "/assets/パクツイ.png"
                when 4 then
                    return "/assets/Firebard.png"
                else
                    return "/assets/freeze.png"
                end

            when 4 then
                case get_level
                when 2 then
                    return "/assets/baby1.png"
                when 3 then
                    return "/assets/baby2.png"
                when 4 then
                    return "/assets/baby3.png"
                else
                    return "/assets/令和.png"
                end

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

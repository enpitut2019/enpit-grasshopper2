class Memo < ApplicationRecord
    validates :memo, length:{maximum:140}
end

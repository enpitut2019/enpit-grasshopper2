class ProfileController < ApplicationController
  def show
    @avatar_name="太郎"
    @level=1
    @exp=100
    @comment="頑張る"
    @icon="assets/卵.png"
    @icon2="assets/ひよこ.png"
    @count=1
  end
end

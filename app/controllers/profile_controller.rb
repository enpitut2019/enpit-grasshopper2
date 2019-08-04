class ProfileController < ApplicationController
  def show
    @avatar_name="太郎"
    @level=1
    @exp=100
    @comment="頑張る"
    @icon="assets/a.jpg"
    @icon2="assets/b.jpg"
    @count=1
  end
end

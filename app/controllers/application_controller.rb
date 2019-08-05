class ApplicationController < ActionController::Base
    #ログイン情報をいろいろな場所で使いたい
    include SessionsHelper
end

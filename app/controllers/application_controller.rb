class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
    def basic_auth
      # basic認証の導入
      authenticate_or_request_with_http_basic do |username, password|
        # 環境変数にusernameとpasswordを記述しているvim ~/.zshrc コマンドで記述し、source ~/.zshrc で実行）
        # herokuでも設定済み
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
end

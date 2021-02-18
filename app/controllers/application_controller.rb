class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def basic_auth
      # basic認証の導入
      authenticate_or_request_with_http_basic do |username, password|
        # 環境変数にusernameとpasswordを記述しているvim ~/.zshrc コマンドで記述し、source ~/.zshrc で実行）
        # herokuでも設定済み
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end

end

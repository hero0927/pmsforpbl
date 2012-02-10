class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user_session, :current_user
  #filter_parameter_logging :password, :password_confirmation

  private
    #現在ログインしているユーザのセッションを取得する
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    #現在ログインしているユーザを取得する
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    #ログインフィルタ：ログインが必要なページでログインしていない場合、強制的にログイン画面にリダイレクトする
    #ログインが必要なページ、機能を持つコントローラで随時呼び出す
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end
 
    #ログアウトフィルタ：require_userのログアウトバージョン
    #ログアウト時に提供する機能を持つコントローラに配置する(基本的にログイン画面のみ)
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to login_url
        return false
      end
    end
    
    #現在いるページのURLを保存する処理
    #require_user #require_no_user内で呼び出されている
    def store_location
      print request.fullpath
      session[:return_to] = request.fullpath
    end
    
    #適切なところへリダイレクトする処理
    #リダイレクト先を指定する場合は、引数にリダイレクト先のURLを与える
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end

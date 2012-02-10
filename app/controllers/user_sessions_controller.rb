class UserSessionsController < ApplicationController
  before_filter :sessionPrepare, :except => :destroy
  before_filter :require_user, :only => :destroy
  
  def new
    render :layout => false
  end
  
  #ログイン処理　ProjectとPmoのトップページにそれぞれ遷移する
  #Createアクションを呼び出すことで、セッションの登録を行うことができる
  def create    
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default @user.gethomeurl
    else
      flash[:notice] = "Login Failure!"
      redirect_to login_url
    end
  end
  
  #ログアウト処理
  #destroyアクションを呼び出すことでセッションの破棄を行うことができる
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end
  
  #セッション登録のための下準備
  private
  def sessionPrepare
    params[:user_session] ||= {}
    @user_session = UserSession.new(params[:user_session])
    @user = User.find_by_login(@user_session.login)
  end
end
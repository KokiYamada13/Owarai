class OwaraisController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @owarai = current_user.owarais.build(owarai_params)
    if @owarai.save
      flash[:success] = 'ネタを投稿しました。'
      redirect_to root_url
    else
      @owarais = current_user.owarais.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ネタの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @owarai.destroy
    flash[:success] = 'ネタを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def owarai_params
    params.require(:owarai).permit(:content, :image)
  end
  
  def correct_user
    @owarai = current_user.owarais.find_by(id: params[:id])
    unless @owarai
      redirect_to root_url
    end
  end
end

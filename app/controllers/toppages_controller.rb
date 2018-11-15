class ToppagesController < ApplicationController
  def index
    if logged_in?
      @owarai = current_user.owarais.build  
      @owarais = current_user.owarais.order('created_at DESC').page(params[:page])
    end  
  end
end

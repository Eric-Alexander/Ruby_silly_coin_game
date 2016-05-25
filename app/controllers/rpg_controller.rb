class RpgController < ApplicationController
  def index
      if session[:gold] == nil
          session[:gold] = 0
      end
      if session[:message] == nil
          session[:message] = []
      end
      session[:count] = session[:gold].to_i + session[:count].to_i
      @count = session[:count]
      @time = Time.new.strftime("%b %d, %Y \n %H:%M %p")




      if session[:gold] > 0
          session[:message] << "Reaped #{session[:gold]} dubloons from the fuckin' #{session[:location]}!!!!! #{@time}"
      elsif session[:gold]<0
          session[:message] << "Fuck someone robbed #{session[:gold]} debloons from you at #{@time}"
      end
    #   session[:message] = ["Reaped this and that"]
      @action = session[:message]
      session[:gold] = 0
      session[:location] = ""
  end

  def new
      if params[:location] == 'casino'
          session[:gold] = rand(-50000..50000)
      elsif params[:location] == 'house'
          session[:gold] = rand(200-500)
      elsif params[:location] == 'farm'
          session[:gold] = rand(1000-2000)
      elsif params[:location] == 'cave'
          session[:gold] = rand(5000-10000)
      end
      session[:location] = params[:location]
      redirect_to '/'
  end
end

class StaticPagesController < ApplicationController
  def home
flash[:success]='Welcome to the Sample App!'
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end

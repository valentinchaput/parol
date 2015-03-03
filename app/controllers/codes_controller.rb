class CodesController < ApplicationController
  def show
    @code = Code.find(params[:id])
  end

  def index
    @codes = Code.all
  end
end

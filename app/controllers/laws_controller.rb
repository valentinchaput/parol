class LawsController < ApplicationController
  def index
    @laws = Law.all
  end

  def show
    @law = Law.find(params[:id])
  end
end

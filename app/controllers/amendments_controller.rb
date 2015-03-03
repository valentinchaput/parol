class AmendmentsController < ApplicationController
  def new
    @amendment = Amendment.new
  end

  def edit
    @amendment = Amendment.find(params[:id])
  end
end

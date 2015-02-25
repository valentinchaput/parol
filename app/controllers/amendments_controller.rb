class AmendmentsController < ApplicationController
  def index
    @amendments = Amendment.all
  end

  def show
    @amendment = Amendment.find(params[:id])
    @instruction = Instruction.new
  end
end

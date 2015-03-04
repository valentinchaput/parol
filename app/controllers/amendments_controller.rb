class AmendmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :edit ]


  def index
    @amendments = Amendment.all
  end

  def new
    @amendment = Amendment.new
  end

  def show
  end

  def edit
    @amendment = Amendment.find(params[:id])
  end
end

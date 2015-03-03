class CodesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def show
    @code = Code.find(params[:id])
  end

  def index
    @codes = Code.all
  end
end

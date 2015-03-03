class LawsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @laws = Law.all
  end

  def show
    @law = Law.find(params[:id])
  end
end

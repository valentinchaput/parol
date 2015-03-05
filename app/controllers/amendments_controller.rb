class AmendmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :edit ]
  before_action :set_law, only: [ :new, :create ]


  def index
    @amendments = Amendment.all
  end

  def new
    @amendment = Amendment.new
  end

  def create
    @amendment = @law_article.amendments.new(amendment_params)
    if @amendment.save
      # TODO: create commit with code articles modified
      params[:code_article].each do |filepath, content|
        @amendment.push_code_article(filepath, content)
      end
    else
      render :new
    end
  end

  def show
  end

  def edit
    @amendment = Amendment.find(params[:id])
  end

  private

  def set_law
    @law_article = LawArticle.find(params[:law_article_id])
  end

  def amendment_params
    params.require(:amendment).permit(:amendment_number, :object, :author)
  end
end

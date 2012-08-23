class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        pdf = PrinterFriendlyArticle.new(@article, view_context)
        send_data pdf.render, filename: "article_#{@article.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end
end

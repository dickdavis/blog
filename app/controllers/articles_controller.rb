class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'rvd', password: 'secret', except: [:index, :show]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    elsif params[:search]
      @articles = Article.search(params[:search])
    else
      @articles = Article.all
    end
    @page = { title: 'Articles',
              subtitle: 'Helpful snippets of advice for fellow Rubyists and others.' }
  end

  def show
    @article = Article.find(params[:id])
    @page = { title: @article.title,
              subtitle: @article.subtitle }
  end

  def new
    @article = Article.new
    @page = { title: 'Create Article',
              subtitle: 'Art is never finished, only abandoned.' }
  end

  def edit
    @article = Article.find(params[:id])
    @page = { title: 'Edit Article',
              subtitle: 'We all look so perfect, as we all fall down.' }
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def feed
    @articles = Article.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :subtitle, :summary, :all_tags)
    end
end

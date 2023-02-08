class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        articles = Article.all
        render json: articles
    end

    def show
        article = Article.find(params[:id])
        render json: article
    end

    def create
        article = Article.create(title: params[:title], author: params[:author], createdOn: params[:createdOn], category: params[:category], body: params[:body], pages: params[:pages])
        render json: article
    end

    def deleteById  
        article = Article.find(params[:id])
        render json: article
        article.destroy
    end

    def deleteByTitle
        article = Article.find_by(title: params[:title])
        render json: article
        article.destroy
    end

    #def delete
    #    field = params[:id] || params[:title] || params[:author] || params[:createdOn] || params[:category]
    #    article = Article.where("#{field} = ?",)

    def update 
        article = Article.find(params[:id])
        article.title = params[:title] || article.title
        article.author = params[:author] || article.author
        article.createdOn = params[:createdOn] || article.createdOn
        article.pages = params[:pages] || article.pages
        article.category = params[:category] || article.category
        article.body = params[:body] || article.body
        article.save
        render json: article
    end

    def findByCategory
        article = Article.where("category = ?", params[:category])
        render json: article
    end

    def findByAuthor
        article = Article.where("author = ?", params[:author])
        render json: article
    end

    def partialTitle
        article = Article.where("title LIKE ?", "%" + Article.sanitize_sql_like(params[:title]) + "%")
        #article = Article.where("title LIKE ?", "%#{params[:title]}%")
        render json: article
    end

    def dateRangeFilter
        article = Article.where(createdOn: (params[:startDate]..params[:endDate]))
        render json: article
    end

end


#how to call a method in another one
#how to make single delete function for all parameters
#how to update iteratively
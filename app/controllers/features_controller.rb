class FeaturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @features = Feature.all
    @features = @features.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @feature = Feature.find_by_id(params[:id])
    @comments = @feature.comments
  end

  def edit
    @feature = Feature.find_by_id(params[:id])
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      redirect_to @feature
    else
      render :edit
    end
  end

  def update
    @feature = Feature.find_by_id(params[:id])

    if @feature.update(feature_params)
      redirect_to @feature, notice: 'Feature was successfully updated.'
    else
      render :edit
    end
  end

  def vote
    @feature = Feature.find_by_id(params[:id])
    vote_type = params[:vote_type] == "upvote" ? :upvotes : :downvotes
    @feature.increment!(vote_type)
    # redirect_to @feature, notice: "Feature was successfully #{params[:vote_type]}d."
  end

  private

  def feature_params
    params.require(:feature).permit(:title, :body)
  end
end

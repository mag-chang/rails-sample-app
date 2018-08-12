class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @reviewer = Reviewer.where(user: params['user_id']).first()
  end

  # GET /reviews/1/edit
  def edit
    @reviewer = Reviewer.where(user: params['user_id']).first()
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    binding.pry
    @review.reviewer_id = params['reviewer_id']
    @review.race_id = params['review']['race_id']
    score = params['review']['star']
    if score.empty?
      score = 0
    end
    @review.score = score

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'レビュー情報を登録しました。' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'レビュー情報を更新しました。' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'レビュー情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user, :race, :score, :content)
    end
end

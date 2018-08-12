class ReviewersController < ApplicationController
  before_action :set_reviewer, only: [:show, :edit, :update, :destroy]

  # GET /reviewers
  # GET /reviewers.json
  def index
    reviewers = Reviewer.all
    @reviewers = Array.new()
    reviewers.each do |reviewer|
      reviewer_hash = Hash.new()
      reviewer_hash['reviewer_model'] = reviewer
      review_count = reviewer.reviews.count()
      race_count = reviewer.races.count()
      reviewer_hash['review_count'] = review_count
      reviewer_hash['race_count'] = race_count
      @reviewers.push(reviewer_hash)
    end

  end

  # GET /reviewers/1
  # GET /reviewers/1.json
  def show
    id = params[:id]
    @reviewer = Reviewer.find(id)
    @review_count = Review.where(reviewer: id).count()
    @race_count = Race.where(reviewers: id).count()
  end

  # GET /reviewers/new
  def new
    @reviewer = Reviewer.new
  end

  # GET /reviewers/1/edit
  def edit
  end

  # POST /reviewers
  # POST /reviewers.json
  def create
    user_id = params[:user_id]
    user = User.find(user_id)

    @reviewer = Reviewer.new(reviewer_params)
    # ログイン中のユーザーを紐付ける
    @reviewer.user = user

    respond_to do |format|
      if @reviewer.save
        user.is_reviewer = true
        user.save
        format.html { redirect_to @reviewer, notice: 'レビュアー情報を登録しました。' }
        format.json { render :show, status: :created, location: @reviewer }
      else
        format.html { render :new }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviewers/1
  # PATCH/PUT /reviewers/1.json
  def update
    respond_to do |format|
      if @reviewer.update(reviewer_params)
        format.html { redirect_to @reviewer, notice: 'レビュアー情報を更新しました。' }
        format.json { render :show, status: :ok, location: @reviewer }
      else
        format.html { render :edit }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewers/1
  # DELETE /reviewers/1.json
  def destroy
    @reviewer.destroy
    user = @reviewer.user
    user.is_reviewer = false
    user.save
    respond_to do |format|
      format.html { redirect_to reviewers_url, notice: 'レビュアー情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer
      @reviewer = Reviewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewer_params
      params.require(:reviewer).permit(:name, :user, :review)
    end
end

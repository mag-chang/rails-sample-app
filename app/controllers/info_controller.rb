class InfoController < ApplicationController
  before_action :sign_in_required, only: [:mypage]

  def index
  end

  def mypage
    @reviewer = Reviewer.where(user: params['user_id']).first
    @reviews = Review.where(reviewer: @reviewer)
  end
end

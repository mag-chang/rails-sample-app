class InfoController < ApplicationController
  before_action :sign_in_required, only: [:mypage]

  def index
  end

  def mypage
  end
end

# frozen_string_literal: true

class PagesController < ApplicationController
  def permalink
    @page = Page.find_by_permalink(params[:permalink])

    if @page
      render :show
    else
      redirect_to root_path
    end
  end

  def show; end
end

class SubjectsController < ApplicationController
  def show
    @subject = Subject.find(params[:code])
  end
end

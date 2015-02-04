class SubjectsController < ApplicationController
  def show
    @subject = Subject.find params[:id]
    @tasks = @subject.tasks
  end
end
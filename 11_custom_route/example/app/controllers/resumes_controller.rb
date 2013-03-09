class ResumesController < ApplicationController

  def show
    @sections = ResumeSection.all
  end

end

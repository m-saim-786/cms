# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :set_student

  def index
    @results = @student.results
  end

  def show
    @result = Result.find(params[:id])
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end
end

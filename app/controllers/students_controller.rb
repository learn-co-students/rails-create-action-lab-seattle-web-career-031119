require "pry"
class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    if params[:first_name] && params[:last_name]
      @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
    else
      @student = Student.create(params[:student].permit!)
    end
    redirect_to student_path(@student)
  end

end

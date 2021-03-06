class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    redirect_to @student
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    binding.pry
    if params[:name]
      @students = Student.search(params[:name])
    else
      @students = Student.all
    end
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end

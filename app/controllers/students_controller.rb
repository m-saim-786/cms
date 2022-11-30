class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :set_grades, only: %i[ new edit create ]

  # GET /students or /students.json
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result
  end

  def unpaid_list
    start_date = params[:month]
    end_date = params[:month] ? params[:month].end_of_month : Date.today
    ids = Student.pluck(:id) - FeeDetail.paid_list(start_date, end_date)
    @students = Student.where(id: ids)
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = current_user.students.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def set_grades
      @grades = Grade.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :roll_no, :Bform, :contact, :age, :father_name, :fee_amount, :grade_id)
    end
end

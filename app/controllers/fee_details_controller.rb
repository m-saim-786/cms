class FeeDetailsController < ApplicationController
  before_action :set_fee_detail, only: %i[ show edit update destroy ]
  before_action :set_student, only: %i[ new edit create update ]

  # GET /fee_details or /fee_details.json
  def index
    @fee_details = FeeDetail.all
  end

  # GET /fee_details/1 or /fee_details/1.json
  def show
  end

  # GET /fee_details/new
  def new
    @fee_detail = FeeDetail.new
  end

  # GET /fee_details/1/edit
  def edit
  end

  # POST /fee_details or /fee_details.json
  def create
    @fee_detail = current_user.fee_details.new(updated_params)
    @fee_detail.amount = @student.fee_amount

    respond_to do |format|
      if @fee_detail.save
        format.html { redirect_to @fee_detail, notice: "Fee detail was successfully created." }
        format.json { render :show, status: :created, location: @fee_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fee_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_details/1 or /fee_details/1.json
  def update
    respond_to do |format|
      if @fee_detail.update(updated_params)
        format.html { redirect_to @fee_detail, notice: "Fee detail was successfully updated." }
        format.json { render :show, status: :ok, location: @fee_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fee_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_details/1 or /fee_details/1.json
  def destroy
    @fee_detail.destroy
    respond_to do |format|
      format.html { redirect_to fee_details_url, notice: "Fee detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_detail
      @fee_detail = FeeDetail.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    def updated_params
      fee_detail_params.merge(student_id: params[:student_id], status: 'paid')
    end

    # Only allow a list of trusted parameters through.
    def fee_detail_params
      params.require(:fee_detail).permit(:submitted_at, :status)
    end
end

# frozen_string_literal: true

class ResultTypesController < ApplicationController
  before_action :set_result_type, only: %i[show edit update destroy]

  # GET /result_types or /result_types.json
  def index
    @result_types = ResultType.all
  end

  # GET /result_types/1 or /result_types/1.json
  def show; end

  # GET /result_types/new
  def new
    @result_type = ResultType.new
  end

  # GET /result_types/1/edit
  def edit; end

  # POST /result_types or /result_types.json
  def create
    @result_type = current_user.result_types.new(result_type_params)

    respond_to do |format|
      if @result_type.save
        format.html { redirect_to @result_type, notice: 'Result type was successfully created.' }
        format.json { render :show, status: :created, location: @result_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_types/1 or /result_types/1.json
  def update
    respond_to do |format|
      if @result_type.update(result_type_params)
        format.html { redirect_to @result_type, notice: 'Result type was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_types/1 or /result_types/1.json
  def destroy
    @result_type.destroy
    respond_to do |format|
      format.html { redirect_to result_types_url, notice: 'Result type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_result_type
    @result_type = ResultType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def result_type_params
    params.require(:result_type).permit(:title, :user_id)
  end
end

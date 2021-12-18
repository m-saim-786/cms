class CashEntriesController < ApplicationController
  before_action :set_cash_entry, only: %i[ show edit update destroy ]

  # GET /cash_entries or /cash_entries.json
  def index
    @cash_entries = CashEntry.all
  end

  # GET /cash_entries/1 or /cash_entries/1.json
  def show
  end

  # GET /cash_entries/new
  def new
    @cash_entry = CashEntry.new
  end

  # GET /cash_entries/1/edit
  def edit
  end

  # POST /cash_entries or /cash_entries.json
  def create
    @cash_entry = current_user.cash_entries.new(cash_entry_params.merge(entry_type: params[:commit]))

    respond_to do |format|
      if @cash_entry.save
        format.html { redirect_to new_cash_entry_path, notice: "Cash entry was successfully created." }
        format.json { render :show, status: :created, location: @cash_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cash_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_entries/1 or /cash_entries/1.json
  def update
    respond_to do |format|
      if @cash_entry.update(cash_entry_params.merge(entry_type: params[:commit]))
        format.html { redirect_to cash_entries_path, notice: "Cash entry was successfully updated." }
        format.json { render :show, status: :ok, location: @cash_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cash_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_entries/1 or /cash_entries/1.json
  def destroy
    @cash_entry.destroy
    respond_to do |format|
      format.html { redirect_to cash_entries_url, notice: "Cash entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_entry
      @cash_entry = CashEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cash_entry_params
      params.require(:cash_entry).permit(:amount, :description, :entry_type, :date)
    end
end

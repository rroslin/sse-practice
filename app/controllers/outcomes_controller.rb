class OutcomesController < ApplicationController
  before_action :set_outcome, only: %i[ show edit update destroy ]

  # GET /outcomes or /outcomes.json
  def index
    @outcomes = Outcome.all
  end

  # GET /outcomes/1 or /outcomes/1.json
  def show
  end

  # GET /outcomes/new
  def new
    @outcome = Outcome.new
  end

  # GET /outcomes/1/edit
  def edit
  end

  # POST /outcomes or /outcomes.json
  def create
    @outcome = Outcome.new(outcome_params)

    respond_to do |format|
      if @outcome.save
        format.html { redirect_to outcome_url(@outcome), notice: "Outcome was successfully created." }
        format.json { render :show, status: :created, location: @outcome }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcomes/1 or /outcomes/1.json
  def update
    respond_to do |format|
      if @outcome.update(outcome_params)
        format.html { redirect_to outcome_url(@outcome), notice: "Outcome was successfully updated." }
        format.json { render :show, status: :ok, location: @outcome }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcomes/1 or /outcomes/1.json
  def destroy
    @outcome.destroy

    respond_to do |format|
      format.html { redirect_to outcomes_url, notice: "Outcome was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outcome_params
      params.require(:outcome).permit(:lis_result_sourcedid, :score, :passing_threshold)
    end
end

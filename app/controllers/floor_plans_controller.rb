class FloorPlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :download]
  before_action :set_and_authorize_floor_plan, only: [:show, :download, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:new, :create] #handled by authentication

  # GET /floor_plans
  # GET /floor_plans.json
  def index
    @floor_plans = FloorPlan.all
    authorize @floor_plans
  end

  # GET /floor_plans/1
  # GET /floor_plans/1.json
  def show
  end

  # GET /floor_plans/1/download
  def download
    # send_data params[:image] || @floor_plan.image.file.read, filename: @floor_plan.title.dehumanize + ".svg", type: 'image/svg+xml', disposition: 'attachment', encoding: 'utf8'
    file_path = @floor_plan.image.file.path
    file_name = @floor_plan.title.dehumanize + ".svg"
    send_file file_path, filename: file_name, type: 'image/svg+xml', disposition: 'attachment'
  end

  # GET /floor_plans/new
  def new
    @floor_plan = FloorPlan.new
  end

  # GET /floor_plans/1/edit
  def edit
  end

  # POST /floor_plans
  # POST /floor_plans.json
  def create
    @floor_plan = current_user.floor_plans.build(floor_plan_params)
    respond_to do |format|
      if @floor_plan.save
        format.html { redirect_to @floor_plan, notice: 'Floor plan was successfully created.' }
        format.json { render :show, status: :created, location: @floor_plan }
      else
        format.html { render :new }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floor_plans/1
  # PATCH/PUT /floor_plans/1.json
  def update
    respond_to do |format|
      if @floor_plan.update(floor_plan_params)
        format.html { redirect_to @floor_plan, notice: 'Floor plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @floor_plan }
      else
        format.html { render :edit }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floor_plans/1
  # DELETE /floor_plans/1.json
  def destroy
    @floor_plan.destroy
    respond_to do |format|
      format.html { redirect_to floor_plans_url, notice: 'Floor plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_floor_plan
      @floor_plan = FloorPlan.find_by_id(params[:id])
      authorize @floor_plan
      true
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_plan_params
      params.require(:floor_plan).permit(:user_id, :title, :image)
    end
end

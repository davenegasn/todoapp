class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
    
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    if @status.save
      redirect_to(tasks_path)
    end 
    
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])
    
    if @status.update(status_params)
      redirect_to(tasks_path)
    end 
   
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def completed
    @status = Status.find(params[:id])

    if@status.completed
      @status.update_attribute(:completed, false)
    else
      @status.update_attribute(:completed, true)
    end
    
    redirect_to(tasks_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:user_id, :task_id, :completed)
    end
end

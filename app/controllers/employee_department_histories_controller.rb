class EmployeeDepartmentHistoriesController < ApplicationController

  # GET /employee_department_histories
  # GET /employee_department_histories.json
  def index
    @employee_department_histories = EmployeeDepartmentHistory.paginate( :page => params[:page], :per_page => 10, :order => "DepartmentID DESC" );
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_department_histories }
    end
  end

  # GET /employee_department_histories/1
  # GET /employee_department_histories/1.json
  def show
    @employee_department_history = EmployeeDepartmentHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_department_history }
    end
  end

  # GET /employee_department_histories/new
  # GET /employee_department_histories/new.json
  def new
    @employee_department_history = EmployeeDepartmentHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_department_history }
    end
  end

  # GET /employee_department_histories/1/edit
  def edit
    @employee_department_history = EmployeeDepartmentHistory.find(params[:id])
  end

  # POST /employee_department_histories
  # POST /employee_department_histories.json
  def create
    @employee_department_history = EmployeeDepartmentHistory.new(params[:employee_department_history])

    respond_to do |format|
      if @employee_department_history.save
        format.html { redirect_to @employee_department_history, notice: 'Employee department history was successfully created.' }
        format.json { render json: @employee_department_history, status: :created, location: @employee_department_history }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_department_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_department_histories/1
  # PUT /employee_department_histories/1.json
  def update
    @employee_department_history = EmployeeDepartmentHistory.find(params[:id])

    respond_to do |format|
      if @employee_department_history.update_attributes(params[:employee_department_history])
        format.html { redirect_to @employee_department_history, notice: 'Employee department history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_department_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_department_histories/1
  # DELETE /employee_department_histories/1.json
  def destroy
    @employee_department_history = EmployeeDepartmentHistory.find(params[:id])
    @employee_department_history.destroy

    respond_to do |format|
      format.html { redirect_to employee_department_histories_url }
      format.json { head :no_content }
    end
  end
end

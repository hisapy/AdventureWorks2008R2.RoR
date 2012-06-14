class EmployeesController < ApplicationController
  
  # POST/employees
  def change_page
	pp = params[:per_page];
	pp = (pp if Integer(pp) rescue 10).to_i;
	session[:per_page] = pp <= 0 ? 10 : pp;
	respond_to do |format|
		format.html { redirect_to :back }
	end
  end
  
  # GET /employees
  def department
	@employees = Employee.paginate( :page => params[:page], :per_page => 10, :order => "BusinessEntityID DESC" );
    respond_to do |format|
      format.html {  render action: "department" } # department.html.erb
    end
  end
  
  
  # GET /employees
  # GET /employees.json
  def index
   @employees = Employee.paginate(
		:page => params[:page], 
		:per_page => session[:per_page], 
	:order => "BusinessEntityID DESC" );
    respond_to do |format|
      format.html {  render action: "index" } # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
	
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
     @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end



	#@employees = Employee.all;
	#@people = Person.all;
	#@last = 0 unless @last != nil;
    #@employees = Employee.select("ROW_NUMBER() as page").where("page BETWEEN ?  AND ? ",@last, @last + 10);
	#@posts = Post.where("content like ? or id = ?", "%" + params[:busqueda] + "%", params[:busqueda])
	#.all
	#@person.all

	
	
		# @employees = Employee.find_by_sql("
			# SELECT e.BusinessEntityID, Firstname, Middlename, Lastname, Jobtitle, Birthdate, Gender, Vacationhours, EmailAddress
			# FROM HumanResources.Employee as e, Person.Person as p, Person.EmailAddress as ea
			# WHERE e.BusinessEntityID = p.BusinessEntityID AND ea.BusinessEntityID = p.BusinessEntityID")
			
	# @new_employee = Employee.first;
	#.paginate(:page => params[:page], :per_page => 30);
			
	#.paginate( :page => params[:page], :per_page => 10, :order => "Firstname DESC" );
	
	#.paginate( :page => params[:page], :per_page => 10, :order => "Firstname DESC" );
	#:locals => {:article =>  article_class.find(article_id) }
	#.paginate :page => params[:page], :order => 'fecha DESC'
class DepartmentsController < ApplicationController

  # GET /departments
  def search
	@department = Department.new
    	respond_to do |format|
            format.html  # index.html.erb
    	end
  end

  # POST /departments
  def results
  	all = params[:all];
  	group = params[:group]
  	name = params[:name]
    if( ( name != nil && name != "") &&  ( group != nil && group != ""))
      @departments = Department.where( "Name like ? and  GroupName like ?", "%"+name+"%","%"+name+"%").paginate( :page => params[:page], :per_page => 10, :order => "DepartmentID DESC" );
	  else	
      if( name != nil && name != "")
        @departments = Department.where( "Name like ?", "%"+name+"%").paginate( :page => params[:page], :per_page => 10, :order => "DepartmentID DESC" );;
		  else  
        @departments = Department.where(" GroupName like ? ", "%"+group+"%").paginate( :page => params[:page], :per_page => 10, :order => "DepartmentID DESC" );;
		  end
	  end
    respond_to do |format|
  		#para asignar formato en realidad busca en resiltados.html.erb
  		format.html
  		format.js#si es un metodo que hace un request ajax entra aca
    end
  end
 


  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.paginate( :page => params[:page], :per_page => 10, :order => "DepartmentID DESC" );
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
    end
  end
end

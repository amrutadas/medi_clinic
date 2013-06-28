class PatientMastersController < ApplicationController
   before_filter :authenticate_user!
require 'will_paginate/array'
if RUBY_VERSION < "1.9" 
require "rubygems" 
require "faster_csv" 
CSV = FCSV 
else 
require "csv"
end
  def index
  
  end
  
 def show
    #@patient_master = PatientMaster.search(params[:search],params[:dropdown]).page(params[:page]).order('created_at DESC')
    @patient_master = PatientMaster.search(params[:search],params[:dropdown]).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patient_master }
   end
 end

 def new

 end
 
  def create
    @patient_master = PatientMaster.new(params[:patient_master])
    
    if @patient_master.save
      flash[:notice] = "Patient Save Successfully ID : "+@patient_master.id.to_s
      render :action => "index"
    end
  end

 def export_to_csv()
    @patient_master= params[:patient_master]
    csv_string = CSV.generate({}) do |csv|
         csv << ["ID","Name","Age","Sex","Email","Land Line","Location","Detailed Address","Created by","Created at"]
         @patient_master.each do |id|
           user=PatientMaster.where("id = ?", id).first
            csv << [user.id, user.name, user.age, user.sex, user.email, user.land_line, user.location, user.detailed_address, user.created_by, user.created_at.to_date]
         end
    end

   send_data csv_string,
   :type => 'text/csv; IMEX=1; charset=iso-8859-1; header=present',
   :disposition => "attachment; filename=PatientMaster.csv"
end

 def each_patient
  id=params[:id]
  @patient=PatientMaster.where("id = ?", id).first
   
 end
  
end

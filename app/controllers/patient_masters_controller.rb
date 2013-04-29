class PatientMastersController < ApplicationController
   before_filter :authenticate_user!
require 'will_paginate/array'
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
  
end

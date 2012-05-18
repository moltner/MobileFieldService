require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'json'

class ServiceOrderController < Rho::RhoController
  include BrowserHelper
  
  def alljson
    @serviceorders = ServiceOrder.find(:all)
    temp = []
    @serviceorders.each do |order|
             temp << { 
                       :desc => order.short_text,
                       :id =>  order.order_id,
                       :objectid => order.object 
                          
                     }
           end
       
           all = { :results => temp }
           render :string => ::JSON.generate(all)
    
    
  end

  # GET /ServiceOrder
  def index
    @serviceorders = ServiceOrder.find(:all)
    render :back => '/app'
  end

  # GET /ServiceOrder/{1}
  def show
    @serviceorder = ServiceOrder.find(@params['id'])
    if @serviceorder
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ServiceOrder/new
  def new
    @serviceorder = ServiceOrder.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ServiceOrder/{1}/edit
  def edit
    @serviceorder = ServiceOrder.find(@params['id'])
    if @serviceorder
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ServiceOrder/create
  def create
    @serviceorder = ServiceOrder.create(@params['serviceorder'])
    redirect :action => :index
  end

  # POST /ServiceOrder/{1}/update
  def update
    @serviceorder = ServiceOrder.find(@params['id'])
    @serviceorder.update_attributes(@params['serviceorder']) if @serviceorder
    redirect :action => :index
  end

  # POST /ServiceOrder/{1}/delete
  def delete
    @serviceorder = ServiceOrder.find(@params['id'])
    @serviceorder.destroy if @serviceorder
    redirect :action => :index  
  end
end
require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'json'

class DataviewController < Rho::RhoController
  include BrowserHelper

  # GET /Dataview
  def index
    @dataviews = Dataview.find(:all)
    render :back => '/app'
  end
  
  def alljson  
      temp = []
      (1..5).each do |i|
        temp << { 
                  :name => "Manschi",
                  :age => i       
                }
      end
  
      all = { :results => temp }
      render :string => ::JSON.generate(all)
    end
  

  # GET /Dataview/{1}
  def show
    @dataview = Dataview.find(@params['id'])
    if @dataview
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Dataview/new
  def new
    @dataview = Dataview.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Dataview/{1}/edit
  def edit
    @dataview = Dataview.find(@params['id'])
    if @dataview
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Dataview/create
  def create
    @dataview = Dataview.create(@params['dataview'])
    redirect :action => :index
  end

  # POST /Dataview/{1}/update
  def update
    @dataview = Dataview.find(@params['id'])
    @dataview.update_attributes(@params['dataview']) if @dataview
    redirect :action => :index
  end

  # POST /Dataview/{1}/delete
  def delete
    @dataview = Dataview.find(@params['id'])
    @dataview.destroy if @dataview
    redirect :action => :index  
  end
end

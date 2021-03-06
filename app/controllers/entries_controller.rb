class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.xml
  before_filter :authenticate, :load_user, :load_phonebook, :secure_user_permissions
  def index
    @entries = @phonebook.entries.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = @phonebook.entries.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = @phonebook.entries.build(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(user_phonebook_entries_path(@user,@phonebook), :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(user_phonebook_entries_path(@user,@phonebook), :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(user_phonebook_entries_path(@user,@phonebook)) }
      format.xml  { head :ok }
    end
  end

  def load_phonebook
    @phonebook = Phonebook.find(params[:phonebook_id])
    if @user == @phonebook.user
      return @phonebook
    else
      return false
    end
  end
end

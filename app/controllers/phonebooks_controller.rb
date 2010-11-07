class PhonebooksController < ApplicationController
  # GET /phonebooks
  # GET /phonebooks.xml
  before_filter :authenticate, :load_user, :secure_user_permissions
  
  def index
    @phonebooks = @user.phonebooks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phonebooks }
    end
  end

  # GET /phonebooks/1
  # GET /phonebooks/1.xml
  def show
    @phonebook = Phonebook.find(params[:id])
    #TODO add in only users phonebooks check here

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phonebook }
    end
  end

  # GET /phonebooks/new
  # GET /phonebooks/new.xml
  def new
    @phonebook = @user.phonebooks.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phonebook }
    end
  end

  # GET /phonebooks/1/edit
  def edit
    @phonebook = Phonebook.find(params[:id])
  end

  # POST /phonebooks
  # POST /phonebooks.xml
  def create
    @phonebook = @user.phonebooks.build(params[:phonebook])

    respond_to do |format|
      if @phonebook.save
        format.html { redirect_to(user_phonebooks_path(@user), :notice => 'Phonebook was successfully created.') }
        format.xml  { render :xml => @phonebook, :status => :created, :location => @phonebook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phonebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phonebooks/1
  # PUT /phonebooks/1.xml
  def update
    @phonebook = Phonebook.find(params[:id])

    respond_to do |format|
      if @phonebook.update_attributes(params[:phonebook])
        format.html { redirect_to(user_path(@user), :notice => 'Phonebook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phonebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phonebooks/1
  # DELETE /phonebooks/1.xml
  def destroy
    @phonebook = Phonebook.find(params[:id])
    @phonebook.destroy

    respond_to do |format|
      format.html { redirect_to(user_path(@user)) }
      format.xml  { head :ok }
    end
  end

  def sendemail
    @phonebook = Phonebook.find(params[:id])
    PhonebookMailer.sendphonebook(@user,@phonebook).deliver

    respond_to do |format|
      if @phonebook.update_attributes(params[:phonebook])
        format.html { redirect_to(user_phonebook_path(@user,@phonebook), :notice => 'Phonebook was successfully emailed.') }
        format.xml  { head :ok }
      end
    end
  end
  
end

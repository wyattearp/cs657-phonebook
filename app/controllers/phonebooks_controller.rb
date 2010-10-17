class PhonebooksController < ApplicationController
  # GET /phonebooks
  # GET /phonebooks.xml
  def index
    @user = User.find(params[:user_id])
    @phonebooks = @user.phonebooks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phonebooks }
    end
  end

  # GET /phonebooks/1
  # GET /phonebooks/1.xml
  def show
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
    @phonebook = @user.phonebooks.build(params[:phonebook])

    respond_to do |format|
      if @phonebook.save
        format.html { redirect_to(user_phonebook_path, :notice => 'Phonebook was successfully created.') }
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
        format.html { redirect_to(@phonebook, :notice => 'Phonebook was successfully updated.') }
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
      format.html { redirect_to(phonebooks_url) }
      format.xml  { head :ok }
    end
  end
end

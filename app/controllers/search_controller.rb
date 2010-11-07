class SearchController < ApplicationController

  before_filter :authenticate, :load_user, :secure_user_permissions

  def standard
    if params[:search]
      user = session[:user]
      pbs = Phonebook.find_all_by_user_id(user.id)
      search = params[:search]
      @search_results = []
      pbs.each do |p|
        phe = Entry.find_all_by_phonebook_id(p.id, :conditions => ["entries.name LIKE ?", "%#{search[:value]}%"] )
        phe.each do |e|
          @search_results.push(e)
        end
      end
    end
  end

  def reverse
    if params[:search]
      user = session[:user]
      pbs = Phonebook.find_all_by_user_id(user.id)
      search = params[:search]
      @search_results = []
      pbs.each do |p|
        phe = Entry.find_all_by_phonebook_id(p.id, :conditions => ["entries.phone LIKE ?", "%#{search[:value]}%"] )
        phe.each do |e|
          @search_results.push(e)
        end
      end
    end
  end

end

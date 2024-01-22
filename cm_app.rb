require 'sinatra'
require 'nokogiri'
require 'htmlentities'
require 'data_mapper'
require 'yard'
require "yard/sinatra"


# Set variables
sinatra_dir="/home/eric/sinatra_proj0"
ditaot_dir="/home/eric/dita-ot-4.1.2/docsrc"
java_dir="/usr/lib/jvm/default-java"

##
# @cat_out dskjsdjksjd
cat_out="<option value=\"form\">Form</option>
  <option value=\"topicmap\">Topicmap</option>
  <option value=\"bookmap\">Bookmap</option>
  <option value=\"images\">Images</option>
  <option value=\"cm\">Content Management</option>
  <option value=\"misc\">Misc</option>
  <option value=\"athlete\">Favorite Atheletes</option>
  <option value=\"movies\">Favorite Movies</option>
  <option value=\"recent_movies\">Recently Viewed Movies</option>
  <option value=\"baseball\">Favorite Baseball Players</option>"
  
  cat_out2="<option value=\"inactive\">Inactive</option>
  <option value=\"front\">Promote to front</option>"

@sinatra_dir= sinatra_dir
# DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.db")
DataMapper::setup(:default, "sqlite3://#{@sinatra_dir}/recall.db")


  
##
# This class defines the form information.
# 
# property :id, Serial<br>
# property :title, String<br>
# property :form_name, String<br>
# property :short_desc, String<br>
# property :category1, String<br>
# property :category2, String<br>
# property :text1, String<br>
# property :text2, String<br>
# property :text2n, String<br>
# property :text3, String<br>
# property :text3n, String<br>
# property :text4, String<br>
# property :text4n, String<br>
# property :text5, String<br>
# property :text5n, String<br>
# property :file1, String<br>
# property :file1n, String<br>
# property :file2, String<br>
# property :file2n, String<br>
# property :content, Text<br>
# property :created_at, DateTime<br>
# property :updated_at, DateTime<br>

class Dita
	include DataMapper::Resource
	property :id, Serial
	property :title, String
	property :form_name, String
	property :short_desc, String
	property :category1, String
	property :category2, String
	property :text1, String
	property :text1n, String
	property :text2, String
	property :text2n, String
	property :text3, String
	property :text3n, String
	property :text4, String
	property :text4n, String
	property :text5, String
	property :text5n, String
	property :file1, String
	property :file1n, String
	property :file2, String
	property :file2n, String
	property :content, Text
	property :created_at, DateTime
	property :updated_at, DateTime
end

DataMapper.auto_upgrade!

#get '/hi' do
    #erb :greeting
#end

#get '/te' do
 #@page_title = "jQuery TE"
 #erb :te
#end

## Displays form1.
get '/form1' do
 @page_title = "Form1"
 @cat_out = cat_out
 @cat_out2 = cat_out2
 erb :form1
end

#get '/te_edit' do
 #@page_title = "jQuery TE Edit"
 #@filen = params[:filen]
 #erb :te_edit
#end

#get '/dir_list' do
 #@page_title = "File Listing - by ditamaps"
 #erb :dir_list
#end

##
# This displays the Create New Form.
#
get '/display' do
 @page_title = "Form Display"
 @id_val = params[:id_val]
 @cat_out = cat_out
 @cat_out2 = cat_out2
 erb :display
end

##
# This displays the New Entry Form.
#
get '/display_entry' do
 @page_title = "Display Entry"
 @id_val = params[:id_val]
 erb :display_entry
end

##
# This displays the form to confirm deletion of an entry.
#
get '/delete_confirm' do
 @page_title = "Delete Confirm"
 @id_val = params[:id_val]
 erb :delete_confirm
end

post '/delete_entry' do
    @page_title = "Delete Entry"
	@n1 = Dita.get params[:id_val]
	erb :delete_entry
end

get '/edit_entry' do
 @page_title = "Edit Entry"
 @id_val = params[:id_val]
 @cat_out = cat_out
 @cat_out2 = cat_out2
 erb :edit_entry
end

get '/edit_entry1' do
 @page_title = "Edit Entry 1"
 @id_val = params[:id_val]
 @cat_out = cat_out
 @cat_out2 = cat_out2
 erb :edit_entry1
end

get '/display_cat' do
 @page_title = "Display by category"
 @cat = params[:cat]
 erb :display_cat
end

get '/display_all' do
 @page_title = "Display All"
 erb :display_all
end

get '/' do
 @page_title = "Home"
 erb :display_front
 end

post '/dir_list' do
  @page_title = "File Listing - by ditamaps"
  @directory = params[:directory]
  erb :dir_list
end

#get '/dir_list_file' do
 #@page_title = "File Listing - by file"
 #erb :dir_list_file
#end

#post '/te_out' do
  #@page_title = "File Listing - by file"
  #@textarea = params[:textarea]
  #@fname = params[:fname]
  #erb :te_out
#end

post '/form1_out' do

@sinatra_dir= sinatra_dir
@ditaot_dir = ditaot_dir
@java_dir = java_dir
	
  @page_title = "Form1 Out"
  @title = params[:title]
  @form_name = params[:form_name]
  @short_desc = params[:short_desc]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  @text1 = params[:text1]
  @text1n = params[:text1n]
  @text2 = params[:text2]
  @text2n = params[:text2n]
  @text3 = params[:text3]
  @text3n = params[:text3n]
  @text4 = params[:text4]
  @text4n = params[:text4n]
  @text5 = params[:text5]
  @text5n = params[:text5n]
  @file1 = params[:file1]
  @file1n = params[:file1n]
  @file2 = params[:file2]
  @file2n = params[:file2n]
  erb :form1_out
end

post '/form2_out' do

@sinatra_dir= sinatra_dir
@ditaot_dir = ditaot_dir
@java_dir = java_dir

@n1 = Dita.get params[:id_val]
	
  @page_title = "Form2 Out"
  @id_val = params[:id_val]
  @title = params[:title]
  @form_name = params[:form_name]
  @short_desc = params[:short_desc]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  @text1 = params[:text1]
  @text1n = params[:text1n]
  @text2 = params[:text2]
  @text2n = params[:text2n]
  @text3 = params[:text3]
  @text3n = params[:text3n]
  @text4 = params[:text4]
  @text4n = params[:text4n]
  @text5 = params[:text5]
  @text5n = params[:text5n]
  @file1 = params[:file1]
  @file1n = params[:file1n]
  @file2 = params[:file2]
  @file2n = params[:file2n]
  erb :form2_out
end

post '/form3_out' do

@sinatra_dir= sinatra_dir
@ditaot_dir = ditaot_dir
@java_dir = java_dir

@n1 = Dita.get params[:id_val]
	
  @page_title = "Form3 Out"
  @id_val = params[:id_val]
  @title = params[:title]
  @form_name = params[:form_name]
  @short_desc = params[:short_desc]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  @text1 = params[:text1]
  @text1n = params[:text1n]
  @text2 = params[:text2]
  @text2n = params[:text2n]
  @text3 = params[:text3]
  @text3n = params[:text3n]
  @text4 = params[:text4]
  @text4n = params[:text4n]
  @text5 = params[:text5]
  @text5n = params[:text5n]
  @file1 = params[:file1]
  @file1n = params[:file1n]
  @file2 = params[:file2]
  @file2n = params[:file2n]
  erb :form3_out
end

#post '/dir_list_file' do
  #@page_title = "File Listing - by file"
  #@directory = params[:directory]
  #erb :dir_list_file
#end

#get '/dir_list_type' do
 #@page_title = "File Listing - by topic"
 #erb :dir_list_type
#end

#post '/dir_list_type' do
  #@page_title = "File Listing - by topic"
  #@directory = params[:directory]
  #erb :dir_list_type
#end



get '/search' do
 @page_title = "Search"
 erb :search
end

post '/search' do
  @page_title = "Search"
  @srch_str = params[:srch_str]
  @directory = params[:directory]
  erb :search
end

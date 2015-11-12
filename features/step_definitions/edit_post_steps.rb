Given(/^there is a post with title "(.*?)" and content "(.*?)"$/) do |arg1, arg2|
@post = Post.create!({ :title => arg1, :content => arg2, :post_time=> Time.now })
@title = arg1;@content = arg2
end

When(/^I edit this post$/) do

# This previous version does not work,seems "Post.where("title =@title").first" returns a nil object,haven't been fixed yet
	#@id = Post.where("title =@title").first.id	#puts "/post/#{@id}/edit"
 	# visit("/post/#{@id}/edit")
#working version doing by not use id
	puts "Visiting #{edit_post_url @post}"
	visit(edit_post_url @post)
end

When(/^I update title to "(.*?)" and content to "(.*?)"$/) do |arg1, arg2|
	fill_in "Title", :with => arg1 		#title
	fill_in "Content", :with => arg2	#content
	#click_button "Update Post" # click_on "Update Post" also OK
	click_on "Edit Post"
	@new_title = arg1; @new_content = arg2
end

Then(/^I can see it has been updated$/) do
  page.should have_content(@new_title)
end






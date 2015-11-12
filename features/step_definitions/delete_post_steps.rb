Given(/^there is a post titled with "(.*?)" and content with "(.*?)"$/) do |arg1, arg2|
  @title = arg1
	@post = Post.create!({ :title => arg1, :content => arg1, :post_time => Time.now })
end

When(/^I am on the post page$/) do
  visit("/posts")
end

When(/^I select a post$/) do
	puts "Visiting #{post_url @post}"
	page.should have_content(@title)
  	visit(post_url @post)
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on arg1  #not click_on button
end

Then(/^the post should be deleted$/) do
  page.should have_no_content(@title)
end



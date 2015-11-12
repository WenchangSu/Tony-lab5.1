Feature: Delete post
As a blog owner
I can delete post
Scenario: Delete post
Given there is a post titled with "Dummy post" and content with "Dummy content"
When I am on the post page
And I select a post
And I click "Delete Post"
Then the post should be deleted
# Changelog

## 5/11/21
* Feature/likes model and database
  * feature(likes model and database): Ran ruby on rails commands to create like model and controller
  * minor updates to like model
  * feature(*) implementing like function
  * feat: like button has been added

Comments:
* Created:
  * like model and controller
  * like button
* User can:
  * like a post once

## 4/11/21
* Feature/login flash message
  * adding flash messages for sign in, up, post and sign out
  * added flash message tests for sign in, up, out and new post
  * Merge branch 'main' into feature/login-flash-message 

Comments:
* Flash messages and tests for:
  * sign in
  * sign out
  * sign up
  * new post

## 4/11/21
* Feature/changelog
  * Feature/changelog: created changelog

Comments:
* Created changelog with our team's commits from the beginning of the project

## 4/11/21
* Fix/tests which include web helper
  * fix: tests failing because 'New post' was renamed to 'New Post', fixed now
  * Merge branch 'main' into fix/new-post-test

Comments:
* Fixed the tests that used the web helpers
* The link was renamed from "New post" to "New Post"
* This has been updated in the web helper to match the website, now the tests don't fail anymore.

## 4/11/21
* Feature/form validation
  * Added validation to models/user.rb but message currently not being shown in the browser
  * Attempting a fix - still not working
  * Added server side validation to log in form
  * Deleted redundant erb files
  * Deleted redundant file. Added server side validation to sign up form
  * Added server side validation to new post form

Comments:
* Added server side form validation for:
  * sign in form
  * sign up form
  * add a new post form
* A user cannot enter empty fields

## 4/11/21
* Feature/sections for posts
  * style: added sections, they have a blue rounded border, new post button now formatted so it has no hyperlink line
  * Merge branch 'main' into feature/sections-for-posts 
  * style: changed style for individual articles
  * refactor: fixed sections so that they're centered, aligned text to the left, changed hover colour to match nav bar
  * Merge branch 'main' into feature/sections-for-posts
  * style: added post_created_date to posts, changed colours

Comments:
* Added sections for posts with border, rounded borders and colours
* Updated colours on page
* Need to think about the 'new post' button and styling.

## 3/11/21
* Feature/homepage to be /posts
  * test(*): updates tests to new expected behaviour
  * feat(*): fix controllers
  * Merge branch 'main' into feature/homepage-to-be-posts 
  * Merge branch 'main' into feature/homepage-to-be-posts 
  * feat(*): fix failing tests
  * test(nav_bar_feature): add tests for the nav bar
  * refactor(*): tidy code

Comments:
* When logged in, home page is now /posts
* Added tests for nav bar
* Updated tests so the expected paths correspond to new behaviour

## 3/11/21
* Feature/nav bar
  * feature(*) navigation bar
  * Merge branch 'main' into feature/nav-bar 
  * Continuing nav bar
  * Merge branch 'main' into feature/nav-bar 
  * feature(*) css for nav bar
  * Added some CSS to the nav bar
  * feature(*) added sign out and user logic and functionality to nav bar
  * Merge branch 'main' into feature/nav-bar 

Comments:
* Created nav bar:
  * link to /posts
  * sign out functionality and conditionals added
  * some css added
  * username visible when logged in

## 3/11/21
* Feature/view specific post
  * wip: start routing and create a view
  * Merge branch 'main' into feature/add-post-id-route 
  * feat(*): link posts on main page to specific post page
  * feat(*): add placeholder content on view for specific post
  * test(posts_controller): add test for show route
  * test(view_post_feature): add feature tests for viewing the specific post

Comments:
* new #show method in PostsController to get a specific post based on a post id, which is passed in the url (accessed through params)
* Add template page for showing a specific post
* Add link to each post to direct to the specific post (this can be changed, just for ease of use)
* Add feature test for adding a new post and viewing it, both by url and by clicking on linkes
* Test controller method, simplecov is 100%

## 3/11/21
* Feature/associate posts with users
  * feat(*): add user id to posts
  * Merge branch 'main' into feature/associate-posts-with-users 
  * test(posts): remove unecessary signing in and out
  * feat(*): posts add user_id
  * feat(*): add web_helper and dry all tests
  * feat(*): use new hash notation
  * chore(*): add web_helper to rails_helper
  * feat(posts_controller): make code clearer for creating posts on the user

Comments:
* Posts are associated with the user that is currently signed in
* Fixed failing tests by mocking signing in for posts tests
* DRY'd feature tests by introducing a web_helper file

## 3/11/21
* feat: order posts by newest
  * Orders the posts by the newest first. A feature test has been written for this too.


## 3/11/21
* Test/unit tests for controllers
  * chore(*): add gitignore
  * feat(*): add simplecov
  * test(users_controller): add tests for users controller
  * test(sessions): write tests for #create
  * test(sessions_controller): add test for logging out
  * feat(*): update all tests, exclude files that contain no functionality
  * merge main into feature

Comments:
* Write unit tests for users and session controller
* Add simplecov gem for code coverage
* Ignore files that do not contain methods in simplecov (test coverage now 100%)

## 3/11/21
* Feature/feature tests
  * Created feature test for signing up
  started to write the login feature test
  * Started sign out feature test
  sign up, sign out, and sign in feature tests completed
  * Merge branch 'main' into feature/feature-tests 
  * Started sign up web helper
  sign_up_spec test
  * Feature tests completed

Comments:
* Created the following feature tests:
  * Sign in
  * Sign up
  * Sign out
* The following test(s) is now passing:
  * User can submit posts

## 3/11/21
* Fix/failing tests
  * tests(*): remove requests tests
  * feat(*): fix tests by stubbing the signing in

Comments:
* Tests were failing due to added authentication causing redirects when not logged in
* Fixed by stubbing the logged_in? method to return true, which enables the tests to pass
* One test still failing due to needing to be signed in, however another branch will fix this, as the signing in helper is being written on another branch

## 2/11/21
* Feature/order posts by newest
  * feat: order posts by newest
  * refactor: put new post link at the top of the page - similar to facebook
  * Merge branch 'main' into feature/order-posts-by-newest
  * test: added feature test for posts_display_by_newest, it cant find 'click_link New post'
  * Merge branch 'main' into feature/order-posts-by-newest
  * tests: added feature test for displaying post by newest, now has sign in and log in so it works
  * Merge branch 'main' into feature/order-posts-by-newest

## 2/11/21
* Chore(*): remove idea folder


## 2/11/21
* Feature/Add authentication
  * Update README.md
  * feat(*): add users and sessions controllers
  * feat(*): add routes for logging in and welcome page, welcome page section next
  * Working on welcome page and sign up
  * feat(*): added user log in page and fixed sign up page
  * login feature added
  * feat: added authorization/authentication
  * refactor: fixed authorized not being found
  * feat(*): authentication working
  * feat(*): authentication working, deleted unused spec files

## 1/11/21
* Feature/Added user stories to the README

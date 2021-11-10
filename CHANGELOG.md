# Changelog

## 10/11/21
* style/welcome-login-signup-pages
  * style(welcome/signup/login pages): put forms in boxes and given large titles etc.

## 10/11/21
* fix/incorrect-storage-config
  * Configuring S3 storage (previous MR) caused the `test` database to be declared incorrectly in `storage.yml`
  * Fixed yaml formatting, all tests passing

## 9/11/21
* style/navbar-changes
  * refactor(application.css): make buttons on the navbar touch the top and bottom of the navbar
  * feat(*): can click on an entire post to go to its individual page
  * refactor/style(posts.css/_new.html.erb): made new_post_box div always lightblue, made posts in line with the posts container
  * refactor(_post.html.erb/application.css/post.css): removed unnecessary break, removed comments, made sign out button have no-wrap attribute
  * refactor(application.css): removed random black border on left side of navbar

Comments:
* Made the posts clickable as well as the navbar static

## 9/11/21
* feature/use-s3-for-storage
  * feat(*): configure production environment to use AWS S3 bucket for storing images

Comments:
* Securely storing AWS credentials in Heroku storage

## 9/11/21
* feature/incorrect details flash message
  * feature(flash message): created incorrect log in details flash message
  * test(flash message): created feature test for incorrect log in details

Comments:
* Added a flash message to appear on /login if user details are entered incorrectly

## 9/11/21
* feature/heroku-setup
  * Add GitHub action for automatically deploying to Heroku on pushing to `main` branch
  * Set homepage to the `welcome` page

## 9/11/21
* feature/upload-a-photo
  * user can choose to upload an image with a post
  * CSS styling centres and scales the image

## 9/11/21
* refactor/render-partial-flash-messages
  * refactor(posts views files): moved repeating flash message code into a render partial
  * refactor(*): switched flash messages and titles around, removed unecessary flash message for a specific users page

Comments:
* Refactored:
  * /welcome
  * /posts
  * /posts/id
  * /posts/user_id/posts

## 9/11/21
* style/post-boxes
  * refactor(post.css): put elements in order of top to bottom, container>new_post_link>posts etc
  * style: added max-width to posts so they cant expand with more text
  * refactor: words without a space wouldn't conform to the div

Comments:
* Also made it so that a post on the individual post page (/posts/:id) doesn't change colour when you hover over it

## 8/11/21 - 9/11/21
* refactor/frontend-changes
  * refactor(*): added margins to flash messages and title for pages
  * refactor: added username + avatar image to show.html (to view a specific post), refactored test to look for a username on that page
  * refactor(posts.css): date now aligned to the right
  * refactor(stylesheets): changed red border and highlighting of the profile image placeholder to match purple font
  * refactor(index.html.erb): profile image icon is now a link to see a specific user's posts
  * refactor(showSpecificUsersPost): date aligned to the right
  * refactor(_post):render partial functionality added for posts
  * refactor(_navbar): profile picture in the navbar is a link to the current user's posts
  * refactor(_navbar): changed navbar to have #username id so its the same username as in posts
  * refactor(posts.css): removed unnecessary text-decorations on other elements
  * refactor(*): added title on home page (news feed), spaced out _post.html.erb file to view divs easier
  * Added css margin to profile image and username on a specific post page
  * refactor(css): changed px to % or em's
  * tests/refactor(view_post_spec): removed expectation to find 'Message: ' in a specific post

Comments:
* Entire post needs to be clickable (currently only the message can be clicked)

  
## 8/11/21
* feature/create-post-on-main-page
  * test(web_helper): update to reflect that posts should be created on homepage
  * feat(*): new post can be added from main page
  * fix(web_helper): update to make failing tests pass
  * refactor(*): extract new post form into a separate file, use this to render partial on homepage and specific user page

Comments:
* some styling has been completed, however this may need to be looked at further

## 8/11/21
* feature/comments model and database
  * comments database, model and controller created
  * comments form renders on each post
  * all comments appear on post with a username and timestamp
  * number of comments will render on each page

Comments:
* timestamp shows how long since the time the comment was posted
* style: there has been no styling done on the comments yet
* comment poster will be the signed in user
* feature and unit tests written for all parts 

## 5/11/21
* style/navbar
  * temp commit
  * post box
  * temp commit
  * refactor(navbar): username on page is now a link to users posts (take… 
  * style: username and profile picture side by side
  * style: new post box is in line with posts
  * Refactored flash message to be in line with posts sections
  * Updating from main
  * fix: fixed failing test

Comments:
* Acebook name left aligned
* Username and signout to be right aligned
* Username to be a link to logged in user's own posts
* Fixed failing feature test with unambiguous element
* Added profile image next to usernames wherever they appear
* Changed font across application

## 5/11/21
* Feature/view all user posts
  * added test and show_posts_by_user method
  * Merge branch 'main' into feature/view-all-user-posts 
  * feat: view posts by a specific user, it also displays the username at the top of the page
  * refactor(view_specific_users_post_spec): changed 1: Hello, world! to user1: Hello, world! (2: became => user2:)
  * Merge branch 'main' into feature/view-all-user-posts
  * docs/tests: updated changelog and created unit tests

Comments:
* Created functionality so that an individual users' posts can be viewed
* Ensured that individual posts are in descending order
* Make new post box the same width as the posts on the page
* Created feature and unit tests for both

## 5/11/21
* Feature/likes model and database
  * feature(likes model and database): Ran ruby on rails commands to create like model and controller
  * minor updates to like model
  * feature(*) implementing like function
  * feat: like button has been added
  * feature(likes-model-and-database): feature test written for like button
  * test(posts_controller_spec): unit test for like functionality

Comments:
* Created:
  * like model and controller
  * like button
* User can:
  * like a post once

* Tests Written: 
  * Feature test for liking a post, and the button becomes disabled
  * Unit test for testing the like method

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

# Facebook
Facebook prototype in Swift

Submitted by: Sam Huskins

Time spent: 8 hours spent in total

## User Stories

The following **required** and **optional** functionality is complete:

* [x] Tapping on a photo in the news feed should expand the photo full screen.
* [x] Tapping the Done button should animate the photo back into its position in the news feed.
* [x] On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
* [x] If the user scrolls a large amount and releases, the full screen photo should dismiss.
* [x] Optional: The full screen photo should be zoomable.

## Video Walkthrough 

Here's a walkthrough of all implemented user stories:

![facebook demo](facebook demo.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
I had the zoom working before I implemented the image paging in full screen mode - now it's sort of working, but messes with the scroll offset. 

I was getting an error when trying to downcast the `NewsFeedViewController` in the `ImageTransition` file, since it's nested in a navigation controller and a tab bar controller, so I set the values in the news feed and assigned the properties as global variables in the imageTransition file. This makes it easier to re-use the `ImageTransition` for other view controllers in the future. 


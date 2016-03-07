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
Had a lot of issues passing data through a segue and ended up using a global variable to hold the image being passed between the two view controllers.  

# FDRatingView

## Requirements
`FDRatingView` requires Swift 3.0 and Xcode 8.

## Installation
### CocoaPods
Use `pod 'FDRatingView'` or `pod 'FDRatingView', :git => 'https://github.com/FelixSFD/FDRatingView.git'` to install this pod.
### Manual Installation
Copy the content of the folder `FDRatingView` (except `info.plist`!) to your project.

## Usage
To use `FDRatingView`, you have to import the module:

`import FDRatingView`

Then initialize the Object with one of the available initializers and add the view as subview to an `UIView`.

### Example 1

![Screenshot 5 Stars](http://i.imgur.com/WlxcJty.png "Screenshot 5 Stars")

```swift
let ratingView = FDRatingView(frame: CGRect(32, 32, 16, 16), style: .star, numberOfStars: 5, fillValue: 2.33, color: .red, lineWidth:0.7, spacing:3.0)
view.addSubview(ratingView)
```

### Example 2

![Screenshot 3 Stars](http://i.imgur.com/cNZmnl3.png "Screenshot 3 Stars")

```swift
let ratingView = FDRatingView(frame: CGRect(32, 32, 16, 16), style: .star, numberOfStars: 3, fillValue: 3, color: .black)
view.addSubview(ratingView)
```
Use `pod 'FDRatingView', :git => 'https://github.com/FelixSFD/FDRatingView.git'` to install this pod

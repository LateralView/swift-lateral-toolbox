# swift-lateral-toolbox

This pod contains classes and extensions with utility methods and UI controls that will make your development process easier and safer. Fully developed in Swift and tested, it also includes an example app. 

The Toolbox is constantly being improved and updated since we use it daily at [Lateral View](https://lateralview.co/) for our own projects.

## Installation

swift-lateral-toolbox is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'swift-lateral-toolbox', :git => 'https://github.com/LateralView/swift-lateral-toolbox.git'
```

## What's in the box?

### Extensions

* **String**
	* Generate random alphanumeric strings
	* Access characters using subscripts
	* Validate email addresses
* **UIColor**
	* Generate a 1-pixel UIImage with a specified color
* **UIImage**
	* Export to JPEG or PNG using a Base64 representation
* **UIView**
	* Create a UIImage snapshot (screen capture) of a view and its subviews
* **UIViewController**
	* Present alerts with just one line of code

### Classes

* **LvRadialProgressView**
	* Display the progress of an ongoing task using a circular progress bar
* **LvViewController**
	* Makes your content aware of the presence of the keyboard and automatically adjusts its bottom constraint
	* Hide the keyboard whenever the user taps outside a control

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Authors and license

swift-lateral-toolbox was developed by the iOS team of [Lateral View](https://lateralview.co/). It is freely available under the MIT license.

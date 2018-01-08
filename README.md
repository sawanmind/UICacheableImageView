
# UICacheableImageView


iOS - UICacheableImageView

Simple and efficient image lazy loading functionality for the iOS written in Swift. UICacheableImageView offers ease of use and complete control over your images.

Version 6.4.2

Features

Asynchronous image downloader on a background thread. Main thread is never blocked.
Instance based for better unit testing your code.
Temporary caching of the downloaded images with automatic OS clean up.
Offers the possibility to set a local project image as a placeholder until the actual image is available
Offers the possibility to add a spinner at the center of the imageView until the image is fetched.
If the imageView's size is 0, it sets dimensions to 40x40 prior to the request. This applies to the default UITableViewCells due to the fact when no initial image is present the imageView is hidden.
Complete control over your image data

Guarantees that the same image url will not be downloaded again but will be fetched from the cache.
Option for force downloading the same image overriding the cache.
Option for clearing images from the cache which correspond to specific URLs so they can be re-downloaded once, instead of force downloading them continuously.
Notifies the caller when the operation is complete providing descreptive error if any.
Image can be scaled to your specific view dimensions for best performance and reduced memory allocation.
Image can be zoomed to full screen
Image can be blurred
Installation

Currently only manual installation is available (1 file)

Find the UICacheableImageView.swift file and copy it to your Swift project. You're done.

Usage

Show an image on an imageView

Create an image object that will hold the instance

It is best that you create one instance per object responsible for the image
    
lazy var UICacheableImageView:UICacheableImageView = UICacheableImageView()
Without completion closure

self.UICacheableImageView.show(imageView:self.imageView, url:"http://something.com/someimage.png")
Without completion closure - With spinner

self.UICacheableImageView.showWithSpinner(imageView:self.imageView, url:"http://something.com/someimage.png")
With completion closure

self.UICacheableImageView.show(imageView:self.imageView, url:"http://something.com/someimage.png") {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
With completion closure - With spinner

self.UICacheableImageView.showWithSpinner(imageView:self.imageView, url:"http://something.com/someimage.png") {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
Show an image with a local image placeholder

Without completion closure

self.UICacheableImageView.show(imageView:self.imageView, url:"http://something.com/someimage.png", defaultImage:"someLocalImageName")
With completion closure

self.UICacheableImageView.show(imageView:self.imageView, url:"http://something.com/someimage.png", defaultImage:"someLocalImageName") {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
Show an image with scaled size for better performance
    
With completion closure and new scaled size

let newSize = CGSize(width: imageViewWidth height: imageViewHeight)
self.UICacheableImageView.show(imageView:self.imageView, url:"http://something.com/someimage.png", size:newSize) {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
With completion closure - With spinner and new scaled size

let newSize = CGSize(width: imageViewWidth height: imageViewHeight)
self.UICacheableImageView.showWithSpinner(imageView:self.imageView, url:"http://something.com/someimage.png", size:newSize) {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
Force download an image with scaled size even if it is stored in cache

With completion closure and new scaled size

let newSize = CGSize(width: imageViewWidth height: imageViewHeight)
self.UICacheableImageView.showOverride(imageView:self.imageView, url:"http://something.com/someimage.png", size:newSize) {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
With completion closure - With spinner and new scaled size

let newSize = CGSize(width: imageViewWidth height: imageViewHeight)
self.UICacheableImageView.showOverrideWithSpinner(imageView:self.imageView, url:"http://something.com/someimage.png", size:newSize) {
    (error:UICacheableImageViewError?) in
    //Image loaded. Do something..
}
Clearing the cache for specific image URLs

Sometimes you just need to re-download a specific image with the exact same name once. Maybe you know it has changed and the cache has the old one.

Clearing the cache

let imageURLs:[String] = ["https://someimage.png", "https://someotherimage.png"]
self.UICacheableImageView.clearCacheForURLs(urls: urls)
//And you're done
Forget UIImageviews. Just get the UIImage

self.UICacheableImageView.fetchImage(url: url) {
    [weak self] (image:UIImage?, error:UICacheableImageViewError?) in
    //image has the UIImage
}
Zoom the image

self.UICacheableImageView.zoom(imageView:self.imageView)
Blur the image (iOS 8 and above)

self.UICacheableImageView.blur(imageView:self.imageView, style: UIBlurEffectStyle.Light)

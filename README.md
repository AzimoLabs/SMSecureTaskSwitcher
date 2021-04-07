# SMSecureTaskSwitcher

Simple library created in order to help with customisation of TaskSwitcher app preview. Presented example replaces preview with blured screenshot but thanks to this tool you are able to use completely custom view as a preview.

![Example1](https://raw.githubusercontent.com/AzimoLabs/SMSecureTaskSwitcher/master/art/example1.png) ![Example2](https://raw.githubusercontent.com/AzimoLabs/SMSecureTaskSwitcher/master/art/example2.png) 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8.0
CocoaPods 1.0

## Installation

SMSecureTaskSwitcher is available through [CocoaPods](http://cocoapods.org). 

To install it, simply add the following line to your Podfile:

```ruby
pod "SMSecureTaskSwitcher"
```

## Usage

Initialize `SMSecureTaskSwitcher` object in your AppDelegate:

```objective-c
self.secureTaskSwitcher = [SMSecureTaskSwitcher new];
```

and call `SMSecureTaskSwitcher:applicationDidEnterBackground` method every time when application is going to background state:

```objective-c
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.secureTaskSwitcher applicationDidEnterBackground];
}
```

## Author

Mateusz Kuźnik, mateusz.kuznik@azimo.com

## License

    Copyright (C) 2016 Azimo

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
    
# Towards financial services available to all
We’re working throughout the company to create faster, cheaper, and more available financial services all over the world, and here are some of the techniques that we’re utilizing. There’s still a long way ahead of us, and if you’d like to be part of that journey, check out our [careers page](https://bit.ly/3vajnu6).

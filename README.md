# SMSecureTaskSwitcher

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8.0
CocoaPods 1.0

## Installation

SMSecureTaskSwitcher is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SMSecureTaskSwitcher"
```

## Usage

The easiest way to use is add two line of code in your AppDelegate.

Firstly you have to initialize `SMSecureTaskSwitcher` class:

```
self.secureTaskSwitcher = [SMSecureTaskSwitcher new];
```

secondly call `SMSecureTaskSwitcher:applicationDidEnterBackground` every time application is going to background state:

```
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.secureTaskSwitcher applicationDidEnterBackground];
}
```

## Author

Mateusz Kuźnik, mateusz.kuznik@azimo.com

## License

SMSecureTaskSwitcher is available under the Apache License, Version 2.0. See the LICENSE file for more info.

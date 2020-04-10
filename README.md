# SHFunnelChart

![](https://img.shields.io/badge/Swift-5.1-blue.svg?style=flat)
[![License](https://img.shields.io/cocoapods/l/BetterSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/BetterSegmentedControl)

If you want to show some data with a visual funnel chart you can you use SHFunnelChart easily.

![Demo](https://github.com/shayan77/SHFunnelChart/blob/master/Funnel.png)

## Features

1) `Uou can customize as much as you can`
2) `Colors, fonts, segments, values and all things can be set`
3) `Use shadows for right or left side of Funnel Chart`
4) `Use animation for showing the chart`

## Requirements

- iOS 11.0+
- Xcode 9+

### Swift Package Manager

SHSegmentedControl is available through Swift Package Manager. To install
it, simply go to Xcode under `File > Swift Packages > Add Package Dependency...`

### Manually

If you prefer not to use SPM, you can integrate SHSegmentedControl into your project manually.

## Usage

You can use SHFunnelChart from storyboard easily.

```swift
funnelChart.animateIntoViewWhenPropertiesChange = true
funnelChart.values = [funnelRegisterCount, donePackageCount, donePickUpCount, morThanTwoPickUpCount]
funnelChart.drawFunnelLeftShadow = true
funnelChart.horizontalLinesThickness = 0.0
funnelChart.colorPalette = [#colorLiteral(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1), #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), #colorLiteral(red: 0.3921568627, green: 0.737254902, blue: 0.168627451, alpha: 0.7340806935), #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 0.7659460616) ]
funnelChart.font = UIFont.IRANSans(size: 16)!
funnelChart.drawHorizontalLines = true
funnelChart.drawLabels = true
```

## Contribution

Feel free to submit Pull Requests or send me your feedback and suggestions!

## Author

Shayan Mehranpoor

- https://github.com/shayan77
- https://www.linkedin.com/in/shayan-mehranpoor/
- shm7723@gmail.com

## License

SHFunnelChart is available under the MIT license. See the LICENSE file for more info.

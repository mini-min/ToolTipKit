#  ToolTipKit
Creating customizable and animated tooltips in UIKit🍏

![Simulator Screen Recording - iPhone 16 Pro - 2025-01-05 at 13 57 36](https://github.com/user-attachments/assets/2ca8a760-3572-45f9-b768-1f0cbde064d2)

<br>

## Usage
### Import
Import the Library `ToolTipKit`.
```Swift
import ToolTipKit
```
### Initialization
To create a tooltip, use the ToolTipView class
  
- The tooltip supports the following directions:   
  - `.top`: Tooltip appears above the source view.
  - `.bottom`: Tooltip appears below the source view.  
  - `.left`: Tooltip appears to the left of the source view.
  - `.right`: Tooltip appears to the right of the source view.  

```Swift
lazy var tooltip = ToolTipView(
    title: "This is a tooltip!",
    type: .top,
    sourceItem: yourSourceView,   // Attach to your target UIView
)
```

### Control
- Show the Tooltip
```Swift
tooltip.show()
```

- Hide the Tooltip
```Swift
tooltip.hide()
```

- Show Tooltip with Timeout 
```Swift
tooltip.showWithTimeout(duration: 3) // Tooltip disappears after 3 seconds
```

- Customize the colors using the following properties
```Swift
tooltip.baseBackgroundColor = .blue
tooltip.baseForegroundColor = .yellow
```

<br>

## Installation
### Using Swift Package Manager
1. In Xcode, go to File > Add Packages.
2. Enter the repository URL: https://github.com/your-repo/ToolTipKit.git.
3. Choose the version or branch you want to integrate.

<br>

## License
ToolTipKit is released under the MIT License. Feel free to use it in your projects!  
See the [LICENSE file](https://github.com/mini-min/ToolTipKit?tab=MIT-1-ov-file) for more info

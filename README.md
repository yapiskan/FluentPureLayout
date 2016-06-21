
# AutoLayoutHelper

This is a helper class for most commonly used autolayout constraints built on top of PureLayout. This helper also is being developed in a fluent way. So you can easily define all your constraints just in 1 line and in a readable format.

Ping me for any suggestions you have!

# Methods

## Pin to superview
Now, we have a view and we want to pin it to its superview. 

```
let containerView = UIView()
self.view.addSubview(containerView)
```

So the line below creates a container view that has left, top, right, and bottom margins.
```
containerView.top(10).left(10).right(10).bottom(10)
```
To make this container view pin to superview all you need to do is
```
containerView.spread()
```
Horizontally pin to superview
```
containerView.spreadHorizontally()
```
Vertically pin to superview
```
containerView.spreadVertically()
```

###All methods
```
func spread() -> UIView
func spreadHorizontally() -> UIView
func spreadVertically() -> UIView
func left(inset: CGFloat) -> UIView
func top(inset: CGFloat) -> UIView
func right(inset: CGFloat) -> UIView
func bottom(inset: CGFloat) -> UIView
```

## Pin to other views

Now, let's say we have two views that should be side by side. So the lines below lets us to reach that easily.
```
let leftView = UIView()
let rightView = UIView()

leftView.top(10).left(10).width(100)
rightView.top(10).pinTo(leftView, left: 5).right(10)
```

To make them one under another,
```
topView.top(10).spreadHorizontally().height(60)
bottomView.pinTo(topView, top: 10).left(10).right(10).height(80)
```

###All methods
```
func pinTo(view: UIView, top: CGFloat) -> UIView
func pinTo(view: UIView, left: CGFloat) -> UIView
func pinTo(view: UIView, bottom: CGFloat) -> UIView
func pinTo(view: UIView, right: CGFloat) -> UIView
```


## Aligning to other views

So we have two views that we want them to aligned same by left and right. So this will create two views one under another with same width and 20 vertical margin.
```
let view1 = UIView()
let view2 = UIView()

view1.top(10).left(10).width(100)
view2.alignTo(view2, left:0).alignTo(view2, right: 0).pinTo(view1, top: 20)
```

###All methods
```
func alignTo(view: UIView, top: CGFloat) -> UIView
func alignTo(view: UIView, left: CGFloat) -> UIView
func alignTo(view: UIView, bottom: CGFloat) -> UIView
func alignTo(view: UIView, right: CGFloat) -> UIView
```



## Axis alignment

To centralize a view on X and Y is as easy as below
```
let view1 = UIView()
view1.size(CGSizeMake(100, 100)).centeredOnX().centeredOnY()
```

To align the axis depending on another will be like below
```
let view1 = UIView()
let view2 = UIView()

view1.size(CGSizeMake(100, 100)).centeredOnX().top(100)
view2.sameX(view1, offset:0).sameY(view1, offset: 150).size(CGSizeMake(60, 60))
```

###All methods
```
func centeredOnX(offset: CGFloat = 0) -> UIView
func centeredOnY(offset: CGFloat = 0) -> UIView
func sameX(view: UIView, offset: CGFloat = 0) -> UIView
func sameY(view: UIView, offset: CGFloat = 0) -> UIView
```

# Where are these constraints?

Good question! We have a good answer for that. 

When you create a constraint like below
```
let view1 = UIView()
view1.top(20).size(CGSizeMake(100, 100)).centeredOnX()
```

You will have 4 constraint stored in your object as an associated property. So if you want to change the top constraint, it is as simple as below
```
view1.topConstraint.constant = 100
self.view.setNeedsUpdateConstraints()
UIView.animateWithDuration(0.25) { completed in
	self.view.layoutIfNeeded()
}
```

###All Constraints
```
var leftConstraint: NSLayoutConstraint?
var rightConstraint: NSLayoutConstraint?
var topConstraint: NSLayoutConstraint?
var bottomConstraint: NSLayoutConstraint?
var heightConstraint: NSLayoutConstraint?
var widthConstraint: NSLayoutConstraint?
var centerXConstraint: NSLayoutConstraint?
var centerYConstraint: NSLayoutConstraint?
```

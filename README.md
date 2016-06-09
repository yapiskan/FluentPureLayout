# AutoLayoutHelper

This is a helper class for most commonly used autolayout functions on top of PureLayout. This helper also is being developed in a fluent way. So you can easily define all your constraints just in 1 line and in a readable format.

# Methods

## Pin to super view
Now, we have a view and we want to pin it to its superview. 
[code]
let containerView = UIView()
self.view.addSubview(containerView)
[code]

// So the line below creates a containerView that has left, top, right, and bottom margins.
containerView.top(10).left(10).right(10).bottom(10)

// to make this containerview pin to superview all you need to do is
containerView.spread()

// horizontally pin to superview
containerView.spreadHorizontally()

// vertically pin to superview
containerView.spreadVertically()

## Pin to other views






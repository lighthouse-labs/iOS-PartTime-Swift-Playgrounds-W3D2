import UIKit
//: # Swift Intro
//:
//: ## Optionals and nil
//:
//: So far we've glossed over this topic by avoiding optionals. That's good! We try to avoid optionality, because it simplifies our code. But often optionals can't be avoided.
//:
//: First let's start with a conversion that doesn't require optionals. If we have a Double and an Int, and we want to do math with them, the compiler won't let us. This is because we can't add two different types together.

var ratio: Double = 10.0 // ratio is a Double
var count: Int = 20 // count is a count

// ratio * count // this line does not compile.

//: To get around this we can convert between types. For example, creating a new Double using an Int.

var countDouble = Double(count) // convert count to a Double

ratio * countDouble // now this works!

//:
//: With that kind of conversion in mind, let's say we have a string that contains the characters 1 and 0, e.g. "10". That looks like a number, but it's a string that contains a text representation of a number.
//:
//: If we want to add 1 to our number-containing-string, we need to convert it to a number. We can do that!

var numberString = "10" // a string containing digits
var convertedNum = Double(numberString) //convert numberString to a Double

//: Now look at the type of the variable `convertedNum`. It's not actually a `Double` it's a `Double?`. The question mark at the end of the type indicates that this variable is "optional". That means we might have a double or we might have nothing. This is because, unlike converting an Int to a Double, the conversion between a `String` and a `Double` might fail! It could fail because some strings don't make sense as numbers. How would you convert the string "😎" to a `Double`...?
//:
//: Ok so that's not too crazy! Things that can fail return optionals, and their type has a question-mark after it, like `Int?`, things that always work give us back non-optionals (e.g. `Int` without a question-mark). Cool!
//:
//: So now let's try to add 1 to our `convertedNum` variable.

//convertedNum = convertedNum + 1 // uncomment this line!

//: Looks like the compiler doesn't like that! It's giving us a cryptic error about applying binary operators and types and things, and offers the suggestion of adding an exclaimation point!
//:
//: We aren't able to do math with `convertedNum` because while it's easy to say how to add `10` and `1` together, Swift doesn't know how to add maybe-nothing-maybe-10 and `1` together.
//:
//: To use our optional Int, we need to unwrap it. There are a few ways to unwrap variables, and we'll need to know at least two of them.
//:
//: The first and most dangerous way is by adding an exclaimation point. This is called "force unwrapping". It will make the compiler ignore the optional and use the contents. So if `convertedNum` contains a number, but it will crash the Playground if our `numberString` contains something that can't be converted to a number.

//: ## Challenge 1
//:
//: Use the example above to write code that tries to convert `inputString` into an `Int`.

var inputString = "hello"
// try to convert inputString to an Int here:


//: If you've done everything right you should see "nil" along the right-hand gutter of the playground. This is what we use to represent "nothing". Only optional variables can have a value of `nil`.
//:
//: ## Challenge 2
//:
//: First, make the second line below compile by adding a force unwrap.
//: Then, change the string "1" to "🔥" and observe how the playground responds (or doesn't respond)

var number = Int("🔥")
// number + 1 // uncomment and fix this.

//: In general, force unwrapping is always a risk for a crash, and should be used sparingly and with caution.
//:
//: Don't forget to comment out or fix the broken line above so your code below works.
//:
//: ## Challenge 3
//:
//: The next way to deal with optionals is called "Conditional unwrapping" or sometimes casually called an "if-let". It's **much** safer, and won't break your Playground.
//:
//: The code below uses a conditional unwrap on `number`. This creates a new variable "unwrapped", but only if `number` is *not* nil. If you option click on the variable `unwrapped` you will notice that it is an `Int` not an `Int?`
//: 
//: Switch the string we're converting in Challenge 2 to something that succeeds and back to something that fails and observe how different bits of code get run.

if let unwrapped = number {
    // unwrapped exists in this block, and is number unwrapped.
    print("\(unwrapped) is an Int and no longer an Int?")
}else{
    // unwrapped doesn't exist in this block.
    print("number did not unwrap")
}

//: ## Challenge 4
//:
//: Here's an optional variable. Conditionally unwrap and print it if it exists, print "no greeting" if it doesn't exist.

var greeting: String? = "Aloha!"


//: ## One last thing...
//:
//: Have a look at the following code:

var number1 = 10 // a number
var advancedNumber1 = number1.advanced(by: 10) // advanced by 10, should be 20

var number2 = Int("10") // maybe a number
var advancedNumber2 = number2?.advanced(by: 10) // advanced by 10, should be maybe 20

//: Use option-click to look at all the variables to get clear on their types. Notice that because `number2` is optional, `advancedNumber2` is also optional. What we're doing with `number2` is called optional-chaining. That's the question mark between `number2` and `.advanceBy(10)`. Using this we can call methods (like `advanceBy`) on variables that are optional.
//:
//: There are two important side effects of optional chaining:
//: 
//: 1. If `number2`'s value is `nil`, advanceBy will not be run.
//: 2. Even though `advanceBy` always succeeds, since it's not always run, `advancedNumber2` is an optional.


//: ## Summary
//:
//: Optionals are a great way of handling complexity, but you have to understand how to work with them. If you have an optional (e.g. `Double?`) and want to convert it to a non-optional (e.g. `Double`), use an if let statement to safely unwrap it. Avoid using force-unwraps when at all possible, as they make your code less stable and less predictable.
//:
//: Optional chaining allows you to put off unwrapping, but it doesn't avoid it entirely.



//: [Next](@next)

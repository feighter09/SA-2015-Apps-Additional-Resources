import Foundation
import UIKit

// Ignore this stuff - just here to get rid of errors
func wrap(view: UIView, _ view2: UIView) {}
func combineViewsInSuperview(view: UIView, _ view2: UIView) {}

var view: UIView!
var articles: [String]!
var currentPage = 0
var isLoadingArticles = true
var hasMoreArticles = true

class CustomClass: Equatable {}
func ==(lhs: CustomClass, rhs: CustomClass) -> Bool { return lhs === rhs }
// Ignore this stuff - just here to get rid of errors


//: ## Cleaner Swift Code 1: Writing More Meaningful Code
//:
//: Note that this was written using Swift 2 syntax
//:
//: ---
//: Code is meant to be read more than it's meant to be executed. Even if you're the only one who's ever going to see
//: the project you're working on, your rate of progress will continually decline if you don't take the time to write
//: code that is easy to read and easy to reason about.

//: ### Lesson 1: Use meaningful names for variables, classes, and functions
//:
//: ---
//:
//: Bad code: What does it do? What did we just create?

let r1 = CGRect(x: 0, y: 0, width: 1, height: 1)
let v1 = UIView(frame: r1)
let r2 = CGRect(x: 1, y: 0, width: 1, height: 1)
let v2 = UIView(frame: r2)
wrap(v1, v2)

//: Better code: anyone can read this and immediately know what's going on.

let leftSide = CGRect(x: 0, y: 0, width: 1, height: 1)
let menuView = UIView(frame: r1)
let rightSide = CGRect(x: 1, y: 0, width: 1, height: 1)
let contentView = UIView(frame: r2)
combineViewsInSuperview(v1, v2)

//: Good code is self-documenting. That is, variable, class, and function names tell the story of what's going on,
//: not comments, which brings us on to...

//: ### Lesson 2: Comments are for "why", not "how"
//:
//: ---
//:
//: Comments should not describe what's going on in the code, or how you did it. When writing comments, you should
//: assume that the reader knows the language at least as well as you do.

//: Bad comments:

func viewDidLoad1() {
  // Add the webView to the current view.
  let webView = UIWebView()
  let request = NSURLRequest(URL: NSURL(string: "www.google.com")!)
  webView.loadRequest(request)
  view.addSubview(webView)
  
  // Initialize info before loading the articles.
  articles = []
  currentPage = 1
  isLoadingArticles = true
  hasMoreArticles = true
}

//: Better:

// note: this function is unnecessary unless there's setup involved.
// If not, "view.addSubview(webView)" without comments is just fine
func addWebView() {
  let webView = UIWebView()
  let request = NSURLRequest(URL: NSURL(string: "www.google.com")!)
  webView.loadRequest(request)
  view.addSubview(webView)
}

func setupArticleProperties() {
  articles = []
  currentPage = 1
  isLoadingArticles = true
  hasMoreArticles = true
}

func viewDidLoad2() {
  addWebView()
  setupArticleProperties()  // properties must be set up before articles are loaded
}

//: More good comments

let myObjects = [CustomClass(), CustomClass()]
let myObject = CustomClass()

// using predicate-based contains because object-based isn't calling our custom `==`
if myObjects.contains({ object in object == myObject }) {}

//: ### Lesson 3: Avoid "Magic Numbers or Values"
//:
//: ----
//:
//: We use numbers and strings a lot in programming, and a lot of times it's hard to tell what they do or why they're there.
//: To combat this and make code more readable, name your constants! It'll make it much easier for others (including
//: future you) to figure out what '6' means, and if necessary, what needs to be changed

//: Bad code:

let password = "asdf"

if password.characters.count < 6 {
  print("Password is too short!")
}

//: Better code: Now we know exactly what '6' means in this code, and if we have to go back and change it, it's
//: obvious where to do so

let MinimumPasswordLength = 6

if password.characters.count < MinimumPasswordLength {
  print("Password is too short!")
}

//: This also applies to string values as well!
//:
//: ---
//: Bad code:

let scores = ["Rockets": 76, "pistons": 80, "Warriors": 32]
let pistonsScore = scores["pistons"]
print("The Pistons scored \(pistonsScore) points")

//: Not only did we have to remember the exact string every time we want to grab the value, but if we misspelled it as
//: I did here, we'd have to change it everywhere we use it.
//:
//: ---
//: Better code:

let RocketsKey = "Rockets"
let PistonsKey = "Pistons"
let WarriorsKey = "Warriors"

let scores2 = [RocketsKey: 76, PistonsKey: 80, WarriorsKey: 32]
let pistonsScore2 = scores2[PistonsKey]  // Auto-complete is now working for us too!

//: The tips laid out above are somewhat contrived; how much they benefit the code in this playground pale in
//: comparison to their impact in a larger project. Just imagine having to change 10 instances of "pistons" just to
//: capitalize the P, if you miss a single one, your code is likely to crash! The main takeaway is: write your code
//: in such a way that it's clear what it means. `v1 = UIView()` says nothing to the reader, while `menuView = UIView()`
//: will tell them exactly what's going on.


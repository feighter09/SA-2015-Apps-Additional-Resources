import UIKit

//: ## Cleaner Swift Code 2: DRY, Modular Code
//:
//: Note that this was written using Swift 2 syntax
//:
//: ---
//: There's an acronym to help you write cleaner code, and it's DRY: Don't Repeat Yourself.
//: Copied code is a sign of poor software engineering, because you want your code to have a single point of maintenence.
//: That is, if you have to change the behavior of the program, you should only have to change one area of code, and the 
//: changes should cascade, or occur everywhere that relies on this behavior. If you copy code aroud in your project, this
//: isn't possible, you'll have to change the code everywhere you use it. Instead, we write functions and use them
//: around our code.

//: ###### But my function does this, and here over here I need something similar, but a little different!
//:
//: ---
//: Now let me introduce the concept of modularity. Keep your functions small, and compose larger functions out
//: of smaller ones. 

//: This has been a lot of talk, let's get to examples. 


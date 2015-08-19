//: Don't worry about this stuff, skip down to the title "Functional Programming in Swift"

import UIKit

class Song {
  let title: String
  let artist: String
  let duration: Double
  
  var likes = 0
  
  init(title: String, artist: String, duration: Double)
  {
    self.title = title
    self.artist = artist
    self.duration = duration
  }
  
  init(jsonDictionary: [String: AnyObject])
  {
    title = jsonDictionary["title"] as! String
    artist = jsonDictionary["artist"] as! String
    duration = jsonDictionary["duration"] as! Double
  }
}

//: ## Cleaner Swift Code 2: Using Functional Programming
//:
//: Note that this was written using Swift 2 syntax
//: 
//: ----
//: 
//: While Swift is an object-oriented language, it was designed in such a way to promote using functional programming as well!
//:
//: This playground will take you through the basics of functional programming by introducing you to three concepts
//: that are central to functional programming: `map`, `filter`, and `reduce`. Before continuing with this playground,
//: you should watch our [video explaining these functions](https://www.youtube.com/watch?v=Ma3H5rwCy_Y)

//: Often functional programming can help you write cleaner, more concise code. Just like spoken languages, in programming
//: there are often multiple ways of expressing the same idea. Take the following code for example, it reads:
//:
//: "initialize a duration of 0, and go through each song in the `songs` array, adding the song's duration to our running total"

let song1 = Song(title: "Never gonna give you up", artist: "Rick Astley", duration: 3.5)
let song2 = Song(title: "Superstition", artist: "Stevie Wonder", duration: 4.3)
let songs = [song1, song2]

var totalDuration: Double = 0
for song in songs {
  totalDuration += song.duration
}

//: For such a simple task, there's a decent amount of code overhead involved. First, we had to initialize a variable to
//: store the running total, then we had to write a `for` loop, and finally we were able to say what we really wanted, 
//: "add each song's duration to our running total.
//: ----
//: Now check out this bit of code that does the same thing

let totalDuration2 = songs.reduce(0) { currentTotal, song in currentTotal + song.duration }

//: If this seems a cryptic, don't worry! The goal of this playground is not to convince you to write functional code
//: whenever possible, but to help get you into more of a functional mindset so that you can recognize situations that
//: would best be solved in a functional manner. Ultimately it's up to you to decide which would end up cleaner
//: between object-oriented and functional code. 

//: While the first example showed marginal benefits, let's try to convert JSON data into our model object, filtering out
//: results we're not interested in.

let json = [
             ["title": "Never gonna give you up", "artist": "Rick Astley", "duration": 3.5],
             ["title": "Superstition", "artist": "Stevie Wonder", "duration": 4.3]
           ]

//: Object-Oriented

var goodSongs = [Song]()
for songJSON in json {
  var song = Song(jsonDictionary: songJSON)
  
  if song.artist != "Rick Astley" {
    song.likes++
    goodSongs.append(song)
  }
}

//: Functional

let goodSongs2 = json.map { jsonDict in Song(jsonDictionary: jsonDict) }      // turn the json into an instance of our Song class
                     .filter { song in return song.artist != "Rick Astley" }  // filter out songs by Rick Astley...
goodSongs2.map { goodSong in goodSong.likes++ }                               // Add a like to each "good song"

//: This example hopefully convinces you that there are times where coding in a more functional manner can result in
//: cleaner, more concise code. In the example we see two uses of `map`. The first transforms json into our `Song`
//: class, and the second, while still a transformation from a song with x likes to x + 1, is used more as a "for each".

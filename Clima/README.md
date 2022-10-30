
![App Brewery Banner](Documentation/AppBreweryBanner.png)
 
## Our Goal

# Screenshots

![Simulator Screen Shot - iPhone 12 - 2022-10-31 at 01 29 36](https://user-images.githubusercontent.com/107383299/198899052-67e8a6e9-8997-4f02-98c3-3fe5c573258b.png)

![Simulator Screen Shot - iPhone 12 - 2022-10-31 at 01 29 39](https://user-images.githubusercontent.com/107383299/198899053-246b7afa-df45-49a8-896a-93b144965a6e.png)

![Simulator Screen Shot - iPhone 12 - 2022-10-31 at 01 29 20](https://user-images.githubusercontent.com/107383299/198899050-86007a5e-6f5b-42f3-81d5-c130cecab46e.png)



We’re going to introduce you to the wonderful world of Application Programming Interfaces (APIs) to grab live data from the internet. If you’re dreaming of making that Twitter-powered stock trading app then you’re about add some serious tools to your toolbelt!

We have made a beautiful, dark-mode enabled weather app. You'll be able to check the weather for the current location based on the GPS data from the iPhone as well as by searching for a city manually. 

* How to create a dark-mode enabled app.
* How to use vector images as image assets.
* Learn to use the UITextField to get user input. 
* Learn about the delegate pattern.
* Swift protocols and extensions. 
* Swift guard keyword. 
* Swift computed properties.
* Swift closures and completion handlers.
* Learn to use URLSession to network and make HTTP requests.
* Parse JSON with the native Encodable and Decodable protocols. 
* Learn to use Grand Central Dispatch to fetch the main thread.
* Learn to use Core Location to get the current location from the phone GPS. 

### Condition Codes
```
switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }

# Evexplore

My solution of the Evenly developer challenge.

**Task:** Implement a small application that allows the user to browse the locations around the Evenly HQ using the Foursquare Places API.

## Installation

1. Clone the repository & open the project in Xcode
2. Navigate to `Product` > `Scheme` > `Edit Scheme...` > `Run` > `Arguments`
3. Create an environment variable called `apiKey` and paste your **Foursquare Places API key**. (To quickly test the App on an external device, temporally specify the API key in the `AppConfig.swift` file)
4. Run the App

## Usage
The App consists of a Map View and a List View that both show locations around the Evenly HQ. Tap on a map pin or a list item to get more info about a location.

## Tests
The project includes a function to test a successful API call.

## ToDo
- Fix flickering map annotations
- implement category icons

## Compatibility
Minimum Deployments
- iOS 16.0
- macOS 13.0

## Draft & Development
I created mock-up of each view of the App in the design tool Figma, which I also used for the App Icon. The final App was then made in SwiftUI without third party modules.

![App Layout](https://github.com/ppauel/evexplore/assets/82803315/fc3c3d1b-4481-493e-87cb-bbef138f8cc8)

![App Icon](https://github.com/ppauel/evexplore/assets/82803315/3626944a-1162-4a74-b54d-b96814227b6d)

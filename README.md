# CALL HANDLER APP #

created by [Tin Jurković](https://www.linkedin.com/in/tinjurkovic/) 
Contact: [tin.jurkovic.dev@gmail.com](tin.jurkovic.dev@gmail.com).

## Setup ##
To run the application follow the next steps:
1. Choose the development team
2. Set the bundle identifier for the main target
3. Set the bundle identifier for the CallAppDirectoryExtension - "main target bundle identifier".CallAppDirectory
4. Under capabilities configure app group for **main target** and **CallAppDirectoryExtension**
5. Locate **SuspiciousList** folder and in the **SuspiciousList** class:  
    1. set identifier of selected AppGroup to **groupIdentifier**
    2. set bundle identifier of CallAppDirectoryExtension to **extensionIdentifier**
6. Run the app.

## Project Setup ##
Application is written with Swift 5, iOS13+. Code architecture is MVVM+C.

## Features ##
A mobile application can create **incoming** and **outgoing** audio and video calls for the purpose of testing the features. Users can manage each call in a way to put it on __hold__ or to __end__ it. With __simple tap on cell__ user can put the call on hold, or can end it with the long press on the cell.
The mobile application supports multiple incoming and outgoing calls. If there is an active incoming call and second incoming call starts, the user can end the current call or put it on hold. 
Also, user can add phone numbers to the Suspicious List and remove them. Added numbers are marked with a "Suspicious" identifier when the call starts to ring. 










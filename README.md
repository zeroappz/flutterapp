# Flutter Application

A new Flutter project with detailed explanation about the concepts within 45 hours.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Flutter is Google's mobile UI framework for crafting high-quality native interfaces on iOS, and Android applications. Flutter uses Dart as its programming language, a modern alternative to JavaScript.

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Pre-requisites:
- VS Code [windows or mac or Linux](https://code.visualstudio.com/Download)
- Android Studio [IDE](https://developer.android.com/studio)
      - set environment varaiable name as: ANDROID_SDK_ROOT, ANDROID_HOME
- AVD Android Virtual Device - Install it from android studio
- Flutter [SDK](https://docs.flutter.dev/get-started/install)
- Dart [SDK](https://dart.dev/get-dart/archive)
	Note: 
            - Go with 64-bit installer or exe file
		- Java JDK [minimum v8.x] installation is mandatory to do all this stuff
            - In addition to that, Environmental Set up has to be done after installing every application, that we will see it in tomorrow's class. I will explain how to do that.



## Reasons for Flutter:
	1. Custom Rendering Engine
		- Android - Material Design UI
		- iOS	- Cupertino Widgets
	2. High Developer tools
	3. Animations, widgets, gestures
	4. Dart OOPs - CRUD operations
	5. Access native SDK (Google Map (alpha stage), Camera, Storage)
	6. Loading gifs
	7. Hot reload (JIT) - AOT (Ahead of Time)
		- AOT - bytecode to Machine code (interpretation) - machine code
		- JIT - bytecode to machinecode, it keeps the byte code
		- feed staright away to the processor
	8. Reduce time for development & testing
	9. Smoother & seemless experince (UI)
	10. Cummunity build
	11. Excellent performance

## Flutter primary Keys to work
      - Flutter run key commands.
      - r Hot reload. 
      - R Hot restart.
      - h List all available interactive commands.
      - d Detach (terminate "flutter run" but leave application running).
      - c Clear the screen
      - q Quit (terminate the application on the device).

# StatelessWidget


## It is the widget that can not be modified or manipulated at any cost and act as a common widget throughout the application
      - Widget build(BuildContext context) {} - build is an function that paints the design or logic based on dart for flutter app
            - returning Widget design


## Classes that we used
## Any class will have a child object to proceed with
      - SingleChildScrollView : to make a page scrollable one
      - Scaffold : Becomes the root object for any page 
      - appbar, body, bottomnavigation
      - ClipOval : to create oval shaped object
      - ClipRRect : rectangle object
      - Row: Children[], mainAxis : horizontal & crossAxis
      - Column: Children[], mainAxis : vertical & crossAxis - horizontal
      - MediaQuery : It will analyze the screen size (16:9, 20:9, 18:9)
      - SafeArea : Instance to handle the device notch
      - EdgeInsets :all(), only(), LTRB(): padding & margin
      - TextFormField : controller to collect the form data & design
      - InputDecoration : design pattern for the form class
      - BoxDecoration : design pattern class for the container
      - showSnackBar() : Provide the pop up alert on the screen
      - TextSpan() : chldren objects, more than one text objects can be created
      - Text() : single text string object can be added
      - TextSpan : to add more text objects and make any text as actionable usinge TapGesture
      - Padding : common Padding object for any child that we create
      - Drawer : that helps to provide the side bar navigation
            - UserAccountDetails
            - ListView: ListTile(icon, text, navigation)
      - BottomNavigationBar : creates the bottom navigation
            - Items (BottomNavigationBarItem)
      - Carousel : creates list of sliding banners
      - AssetImage: Loads the local assets or loads iwithout internet
      - NetworkImages: load form the live URL
      - GridView.builder() to create list of images with even screen splitup to provide the gallery view
      - SliverGridDelegateWithFixedCrossAxisCount fixed cross axis
      - InkWell: will make any object as a actionable one
      - Container : ListView.builder() creates dynamic list object on both symmetric
      - routes in main.dart : sets the alias for all the classes (pages)


## Library
      - To make any folder as a library we should provide (part of library;) in each file.
      - in the library file (values.dart in our case), we must include (library values)


## Common Flutter Commands
      - flutter run
      - flutter build
      - flutter pub get
      - flutter pub outdated
      - flutter pub upgrade
      - flutter doctor
      - flutter pub run flutter_launcher_icons:main
      - flutter build apk
      - flutter build appbundle
      - flutter build apk --split-per-abi
      - flutter pub run rename --bundleId com.algo.fusion
      - flutter pub run rename --appname "Delivery App"
      - pub global activate rename
      - pub global run rename --bundleId com.onatcipli.networkUpp
      - pub global run rename --appname "Network Upp"
      - dart migrate --apply-changes


## KeyTool and Chain:
	- keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

## SHA-1 Key generate:
	- keytool -list -v \ -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
	
	- keytool -list -v -keystore C:\Users\user
	
	- keytool -list -v -alias androiddebugkey -keystore  %USERPROFILE%\.android\debug.keystore\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
	
	- keytool -exportcert -v -alias androiddebugkey -keystore %USERPROFILE%/.android/debug.keystore (encrypted)
	
	- keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%/.android/debug.keystore (readable)
# Application Flow from End-to-End

## We follow the factors which qualify to be a benchmark in evaluating application development approaches with some of the potential criteria listed below: 
      - UI: Look and feel
      - Cross-Platform Framework : Mobile OS platform support
      - Leveraging device capabilities
      - Application Development accelerators setup
      - Business Logic Development
      - API development and Interegration
      - Manual & Automated Testing : Alpha & Beta
      - Packaging & distribution
      - File Server Hosting
      - Google Play Store & Apple Store Beta & Production Release
      - Final User End Testing
      - Long term feasibility & developer community
      - Source Updation, Platform, licencing model and other maintenance
      - Future (async - will initiate function access cuncurrently, await will get the response until it will collect all the information)
      - PageView.builder() - create dynamic pages based on the list of data with static design pattern
  
## Notifications
      - Live Push Notification (Firebase PN, OneSignal PN - SMS, PUSH, EMAIL)
      - Local Push Notification 
      - Scheduled Notifications
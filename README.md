# dealsapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Flutter primary Keys to work
- Flutter run key commands.
- r Hot reload. 
- R Hot restart.
- h List all available interactive commands.
- d Detach (terminate "flutter run" but leave application running).
- c Clear the screen
- q Quit (terminate the application on the device).

## StatelessWidget


It is the widget that can not be modified or manipulated at any cost and act as a common widget throughout the application
 - Widget build(BuildContext context) {} - build is an function that paints the design or logic based on dart for flutter app
    - returning Widget design


## Classes that we used
Any class will have a child object to proceed with
   - SingleChildScrollView - to make a page scrollable one
   - Scaffold - Becomes the root object for any page 
      - appbar, body, bottomnavigation
   - ClipOval - to create oval shaped object
   - Row: Children[], mainAxis - horizontal & crossAxis
   - Column: Children[], mainAxis - vertical & crossAxis - horizontal
   - MediaQuery : It will analyze the screen size (16:9, 20:9, 18:9)
   - SafeArea - Instance to handle the device notch
   - EdgeInsets - all(), only(), LTRB(): padding & margin
   - TextFormField - controller to collect the form data & design
   - InputDecoration - design pattern for the form class
   - Boxdecoration - design pattern class for the container
   - showSnackBar() - Provide the pop up alert on the screen
   - TextSpan() - chldren objects, more than one text objects can be created
   - Text() - single text string object can be added

// import 'package:flutter/material.dart';
// import 'package:flutter_maps/countdown.dart';
// import 'package:flutter_maps/loader.dart';
// // import 'package:flutter_maps/secrets.dart'; // Stores the Google Maps API Key
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:math' as math;
// import 'package:audioplayers/audioplayers.dart';

// late int iNeedDist;

// class MapView extends StatefulWidget {
//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
//   late GoogleMapController mapController;

//   late Position _currentPosition;
//   String _currentAddress = '';

//   final startAddressController = TextEditingController();
//   final destinationAddressController = TextEditingController();

//   final startAddressFocusNode = FocusNode();
//   final desrinationAddressFocusNode = FocusNode();

//   String _startAddress = '';
//   String _destinationAddress = '';
//   String? _placeDistance;

//   Set<Marker> markers = {};

//   late PolylinePoints polylinePoints;
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];

//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   Widget _textField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     required String label,
//     required String hint,
//     required double width,
//     required Icon prefixIcon,
//     Widget? suffixIcon,
//     required Function(String) locationCallback,
//   }) {
//     return Container(
//       width: width * 0.8,
//       child: TextField(
//         onChanged: (value) {
//           locationCallback(value);
//         },
//         controller: controller,
//         focusNode: focusNode,
//         decoration: new InputDecoration(
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           labelText: label,
//           filled: true,
//           fillColor: Colors.white,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//             borderSide: BorderSide(
//               color: Colors.grey.shade400,
//               width: 2,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//             borderSide: BorderSide(
//               color: Colors.blue.shade300,
//               width: 2,
//             ),
//           ),
//           contentPadding: EdgeInsets.all(15),
//           hintText: hint,
//         ),
//       ),
//     );
//   }

//   // Method for retrieving the current location
//   _getCurrentLocation() async {
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) async {
//       setState(() {
//         _currentPosition = position;
//         print('CURRENT POS: $_currentPosition');
//         mapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 18.0,
//             ),
//           ),
//         );
//       });
//       await _getAddress();
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   // Method for retrieving the address
//   _getAddress() async {
//     try {
//       List<Placemark> p = await placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);

//       Placemark place = p[0];

//       setState(() {
//         _currentAddress =
//             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
//         startAddressController.text = _currentAddress;
//         _startAddress = _currentAddress;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   // Method for calculating the distance between two places
//   Future<bool> _calculateDistance() async {
//     try {
//       // Retrieving placemarks from addresses
//       List<Location> startPlacemark = await locationFromAddress(_startAddress);
//       List<Location> destinationPlacemark =
//           await locationFromAddress(_destinationAddress);

//       // Use the retrieved coordinates of the current position,
//       // instead of the address if the start position is user's
//       // current position, as it results in better accuracy.
//       double startLatitude = _startAddress == _currentAddress
//           ? _currentPosition.latitude
//           : startPlacemark[0].latitude;

//       double startLongitude = _startAddress == _currentAddress
//           ? _currentPosition.longitude
//           : startPlacemark[0].longitude;

//       double destinationLatitude = destinationPlacemark[0].latitude;
//       double destinationLongitude = destinationPlacemark[0].longitude;

//       String startCoordinatesString = '($startLatitude, $startLongitude)';
//       String destinationCoordinatesString =
//           '($destinationLatitude, $destinationLongitude)';

//       // Start Location Marker
//       Marker startMarker = Marker(
//         markerId: MarkerId(startCoordinatesString),
//         position: LatLng(startLatitude, startLongitude),
//         infoWindow: InfoWindow(
//           title: 'Start $startCoordinatesString',
//           snippet: _startAddress,
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//       );

//       // Destination Location Marker
//       Marker destinationMarker = Marker(
//         markerId: MarkerId(destinationCoordinatesString),
//         position: LatLng(destinationLatitude, destinationLongitude),
//         infoWindow: InfoWindow(
//           title: 'Destination $destinationCoordinatesString',
//           snippet: _destinationAddress,
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//       );

//       // Adding the markers to the list
//       markers.add(startMarker);
//       markers.add(destinationMarker);

//       print(
//         'START COORDINATES: ($startLatitude, $startLongitude)',
//       );
//       print(
//         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
//       );

//       // Calculating to check that the position relative
//       // to the frame, and pan & zoom the camera accordingly.
//       double miny = (startLatitude <= destinationLatitude)
//           ? startLatitude
//           : destinationLatitude;
//       double minx = (startLongitude <= destinationLongitude)
//           ? startLongitude
//           : destinationLongitude;
//       double maxy = (startLatitude <= destinationLatitude)
//           ? destinationLatitude
//           : startLatitude;
//       double maxx = (startLongitude <= destinationLongitude)
//           ? destinationLongitude
//           : startLongitude;

//       double southWestLatitude = miny;
//       double southWestLongitude = minx;

//       double northEastLatitude = maxy;
//       double northEastLongitude = maxx;

//       // Accommodate the two locations within the
//       // camera view of the map
//       mapController.animateCamera(
//         CameraUpdate.newLatLngBounds(
//           LatLngBounds(
//             northeast: LatLng(northEastLatitude, northEastLongitude),
//             southwest: LatLng(southWestLatitude, southWestLongitude),
//           ),
//           100.0,
//         ),
//       );

//       // Calculating the distance between the start and the end positions
//       // with a straight path, without considering any route
//       // double distanceInMeters = await Geolocator.bearingBetween(
//       //   startLatitude,
//       //   startLongitude,
//       //   destinationLatitude,
//       //   destinationLongitude,
//       // );

//       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
//           destinationLongitude);

//       double totalDistance = 0.0;

//       // Calculating the total distance by adding the distance
//       // between small segments
//       /*for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//         totalDistance += _coordinateDistance(
//           polylineCoordinates[i].latitude,
//           polylineCoordinates[i].longitude,
//           polylineCoordinates[i + 1].latitude,
//           polylineCoordinates[i + 1].longitude,
//         );
//       }*/

//       totalDistance = Geolocator.distanceBetween(startLatitude, startLongitude,
//           destinationLatitude, destinationLongitude);

//       totalDistance = totalDistance + 1000;
//       iNeedDist = totalDistance.toInt();

//       setState(() {
//         _placeDistance = totalDistance.toStringAsFixed(2);
//         print('DISTANCE: $totalDistance km');
//       });

//       return true;
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }

//   // Formula for calculating distance between two coordinates
//   // https://stackoverflow.com/a/54138876/11910277
//   /*double _coordinateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }*/

//   // Create the polylines for showing the route between two places
//   _createPolylines(
//     double startLatitude,
//     double startLongitude,
//     double destinationLatitude,
//     double destinationLongitude,
//   ) async {
//     polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyADERfbZFIzp4w2SPGdBQbzyvzFBmK4dBk', // Google Maps API Key
//       PointLatLng(startLatitude, startLongitude),
//       PointLatLng(destinationLatitude, destinationLongitude),
//       travelMode: TravelMode.transit,
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }

//     PolylineId id = PolylineId('poly');
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.red,
//       points: polylineCoordinates,
//       width: 3,
//     );
//     polylines[id] = polyline;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String? needDist = _placeDistance;

//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       height: height,
//       width: width,
//       child: Scaffold(
//         key: _scaffoldKey,
//         body: Stack(
//           children: <Widget>[
//             // Map View
//             GoogleMap(
//               markers: Set<Marker>.from(markers),
//               initialCameraPosition: _initialLocation,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: false,
//               mapType: MapType.normal,
//               zoomGesturesEnabled: true,
//               zoomControlsEnabled: false,
//               polylines: Set<Polyline>.of(polylines.values),
//               onMapCreated: (GoogleMapController controller) {
//                 mapController = controller;
//               },
//             ),
//             // Show zoom buttons
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     ClipOval(
//                       child: Material(
//                         color: Colors.blue.shade100, // button color
//                         child: InkWell(
//                           splashColor: Colors.blue, // inkwell color
//                           child: SizedBox(
//                             width: 50,
//                             height: 50,
//                             child: Icon(Icons.add),
//                           ),
//                           onTap: () {
//                             mapController.animateCamera(
//                               CameraUpdate.zoomIn(),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ClipOval(
//                       child: Material(
//                         color: Colors.blue.shade100, // button color
//                         child: InkWell(
//                           splashColor: Colors.blue, // inkwell color
//                           child: SizedBox(
//                             width: 50,
//                             height: 50,
//                             child: Icon(Icons.remove),
//                           ),
//                           onTap: () {
//                             mapController.animateCamera(
//                               CameraUpdate.zoomOut(),
//                             );
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             // Show the place input fields & button for
//             // showing the route
//             SafeArea(
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white70,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20.0),
//                       ),
//                     ),
//                     width: width * 0.9,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text(
//                             'Places',
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                           SizedBox(height: 10),
//                           _textField(
//                               label: 'Start',
//                               hint: 'Choose starting point',
//                               prefixIcon: Icon(Icons.looks_one),
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.my_location),
//                                 onPressed: () {
//                                   startAddressController.text = _currentAddress;
//                                   _startAddress = _currentAddress;
//                                 },
//                               ),
//                               controller: startAddressController,
//                               focusNode: startAddressFocusNode,
//                               width: width,
//                               locationCallback: (String value) {
//                                 setState(() {
//                                   _startAddress = value;
//                                 });
//                               }),
//                           SizedBox(height: 10),
//                           _textField(
//                               label: 'Destination',
//                               hint: 'Choose destination',
//                               prefixIcon: Icon(Icons.looks_two),
//                               controller: destinationAddressController,
//                               focusNode: desrinationAddressFocusNode,
//                               width: width,
//                               locationCallback: (String value) {
//                                 setState(() {
//                                   _destinationAddress = value;
//                                 });
//                               }),
//                           SizedBox(height: 10),
//                           Visibility(
//                             visible: _placeDistance == null ? false : true,
//                             child: Text(
//                               'DISTANCE: $_placeDistance m',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           /*ElevatedButton(
//                             onPressed: (_startAddress != '' &&
//                                     _destinationAddress != '')
//                                 ? () async {
//                                     startAddressFocusNode.unfocus();
//                                     desrinationAddressFocusNode.unfocus();
//                                     setState(() {
//                                       if (markers.isNotEmpty) markers.clear();
//                                       if (polylines.isNotEmpty)
//                                         polylines.clear();
//                                       if (polylineCoordinates.isNotEmpty)
//                                         polylineCoordinates.clear();
//                                       _placeDistance = null;
//                                     });

//                                     _calculateDistance().then((isCalculated) {
//                                       if (isCalculated) {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           SnackBar(
//                                             content: Text(
//                                                 'Distance Calculated Sucessfully'),
//                                           ),
//                                         );
//                                       } else {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(
//                                           SnackBar(
//                                             content: Text(
//                                                 'Error Calculating Distance'),
//                                           ),
//                                         );
//                                       }
//                                     });
//                                   }
//                                 : null,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Show Route'.toUpperCase(),
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                 ),
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: Colors.red,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                             ),
//                           ),*/
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: (_startAddress != '' &&
//                                           _destinationAddress != '')
//                                       ? () async {
//                                           startAddressFocusNode.unfocus();
//                                           desrinationAddressFocusNode.unfocus();
//                                           setState(() {
//                                             if (markers.isNotEmpty)
//                                               markers.clear();
//                                             if (polylines.isNotEmpty)
//                                               polylines.clear();
//                                             if (polylineCoordinates.isNotEmpty)
//                                               polylineCoordinates.clear();
//                                             _placeDistance = null;
//                                           });

//                                           _calculateDistance()
//                                               .then((isCalculated) {
//                                             if (isCalculated) {
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(
//                                                 SnackBar(
//                                                   content: Text(
//                                                       'Distance Calculated Sucessfully'),
//                                                 ),
//                                               );
//                                             } else {
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(
//                                                 SnackBar(
//                                                   content: Text(
//                                                       'Error Calculating Distance'),
//                                                 ),
//                                               );
//                                             }
//                                           });
//                                         }
//                                       : null,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       'Show Route'.toUpperCase(),
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20.0,
//                                       ),
//                                     ),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     primary: Colors.red,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   width: 130,
//                                   child: ElevatedButton(
//                                       onPressed: () async {
//                                         Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ColorLoader2()));

//                                         await Future.delayed(
//                                             Duration(seconds: 3), () {
//                                           Navigator.pushReplacement(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder:
//                                                       (BuildContext context) =>
//                                                           CountDownTimer()));
//                                         });
//                                       },
//                                       child: Text('Calculate Time')),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Show current location button
//             SafeArea(
//               child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
//                   child: ClipOval(
//                     child: Material(
//                       color: Colors.orange.shade100, // button color
//                       child: InkWell(
//                         splashColor: Colors.orange, // inkwell color
//                         child: SizedBox(
//                           width: 56,
//                           height: 56,
//                           child: Icon(Icons.my_location),
//                         ),
//                         onTap: () {
//                           mapController.animateCamera(
//                             CameraUpdate.newCameraPosition(
//                               CameraPosition(
//                                 target: LatLng(
//                                   _currentPosition.latitude,
//                                   _currentPosition.longitude,
//                                 ),
//                                 zoom: 18.0,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:dealsapp/pages/shimmer_loading.dart/shimmer_loading1.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';

class GoogleMapsListPage extends StatefulWidget {
  const GoogleMapsListPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsListPage> createState() => _GoogleMapsListPageState();
}

class _GoogleMapsListPageState extends State<GoogleMapsListPage> {
  // initializing the global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    // API Loading and other pre loaded data access
    super.initState();
  }

  @override
  void dispose() {
    // dispose the API loading and other pre loaded data access
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        children: [
          Container(
            child: const Text(
              'Google Maps Page',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.height_16,
          ),
          Container(
            child: const Text(
              'Google Maps Page',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.height_16,
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 0',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 1',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 2',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 2',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 3',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Maps Page 4',
            page: const ShimmerLoadingPage1(),
          ),
        ],
      ),
    );
  }
}

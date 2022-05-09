import 'package:esecure/adminpage.dart';
import 'package:esecure/bluetooth.dart';
import 'package:esecure/db/contact_helper.dart';
import 'package:esecure/menu.dart';
import 'package:esecure/model/contacts_view.dart';
import 'package:esecure/sos.dart';
import 'package:flutter/material.dart';
import 'package:esecure/services/authservice.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color purpleColor = Colors.purple.shade700;
  late Position currentPosition;
  late String currentLocation = 'location';
  String mapLink = 'http://maps.google.com/maps?q=';
  ContactHelper _contactHelper = ContactHelper();

  void onSosTap() async {
    List<dynamic> phoneNumber = await _contactHelper.getContacts();

    if (phoneNumber.isNotEmpty) {
      print(phoneNumber);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => EmergencyScreen()));
    } else {
      print('Contacts Doesnt Exist');
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ContactView()));
    }
  }

  Future<Position?> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
    return null;
  }

  void onLocationTap() async {
    String currentAddress = currentPosition.latitude.toString() +
        "," +
        currentPosition.longitude.toString();
    launch(mapLink + currentAddress);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final number = "9322224527";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Trueno',
          ),
        ),
        backgroundColor: purpleColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FlutterBlueApp(),
                  ),
                );
              },
              shape: CircleBorder(),
              child: Icon(
                Icons.bluetooth,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              elevation: 7.0,
              color: Colors.red,
              shape: CircleBorder(),
              onPressed: () async {
                _getGeoLocationPosition();
                onSosTap();
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => EmergencyScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(80),
                child: Text(
                  'SOS',
                  style: TextStyle(
                      color: Colors.white, fontSize: 24, fontFamily: "Trueno"),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () => launch(mapLink + "Nearby+Hospitals"),
                child: Container(
                    height: 50.0,
                    width: 300.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(25.0),
                        shadowColor: Colors.purpleAccent,
                        color: purpleColor,
                        elevation: 7.0,
                        child: Center(
                            child: Text('Nearby Hospitals',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Trueno'))))),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () => launch(mapLink + "Nearby+Police+Station"),
              child: Container(
                  height: 50.0,
                  width: 300.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      shadowColor: Colors.purpleAccent,
                      color: purpleColor,
                      elevation: 7.0,
                      child: Center(
                          child: Text('Nearby Police Station',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Trueno'))))),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () => launch(mapLink + "Nearby+Malls"),
              child: Container(
                  height: 50.0,
                  width: 300.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      shadowColor: Colors.purpleAccent,
                      color: purpleColor,
                      elevation: 7.0,
                      child: Center(
                          child: Text('Nearby Public Places',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Trueno'))))),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: purpleColor,
        closeManually: false,
        child: Icon(Icons.add),
        overlayColor: Colors.white,
        overlayOpacity: 0.5,
        curve: Curves.easeIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.call),
            label: 'Emergency Call',
            backgroundColor: purpleColor,
            onTap: () async {
              await FlutterPhoneDirectCaller.callNumber(number);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.contacts),
            label: 'Contacts',
            backgroundColor: purpleColor,
            onTap: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ContactView()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.location_on),
            label: 'Location',
            backgroundColor: purpleColor,
            onTap: () async {
              await _getGeoLocationPosition();
              onLocationTap();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.deepPurple,
                Colors.purpleAccent,
              ])),
              child: Container(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'images/logo.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'E-Secure',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Trueno',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomTitle(Icons.settings, 'Settings', () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Menu()));
            }),
            CustomTitle(Icons.bar_chart_rounded, 'Analysis', () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminPage()));
            }),
            CustomTitle(
              Icons.logout,
              'Logout',
              () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function() onTap;
  CustomTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: InkWell(
          splashColor: Colors.purpleAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Trueno'),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esecure/db/contact_helper.dart';
import 'package:esecure/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:telephony/telephony.dart';

class EmergencyScreen extends StatefulWidget {
  EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  static const maxSeconds = 10;
  int _counter = maxSeconds;
  Timer? _timer;
  ContactHelper _contactHelper = ContactHelper();
  CollectionReference location =
      FirebaseFirestore.instance.collection('location');
  final Telephony telephony = Telephony.instance;
  Color purpleColor = Colors.purple.shade700;
  late Position currentPosition;
  late String currentLocation = 'location';
  String mapLink = 'http://maps.google.com/maps?q=';

  Future<Position?> _getGeoLocationPosition() async {
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentPosition = position;
        currentLocation = "${place.subLocality}";
      });
    } catch (e) {
      ErrorHandler().errorDialog(context, e);
    }
    return null;
  }

  final SmsSendStatusListener listener = (SendStatus status) {};

  void onSosTap() async {
    await _getGeoLocationPosition();
    String currentAddress = currentPosition.latitude.toString() +
        "," +
        currentPosition.longitude.toString();
    String link =
        "Help I'm in danger this my location:\n" + mapLink + currentAddress;
    List<dynamic> phoneNumber = await _contactHelper.getContacts();
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    if (permissionsGranted == true) {
      for (String number in phoneNumber) {
        await telephony.sendSms(
            to: number, message: link, statusListener: listener);
      }
    }
    await location
        .add({'areaname': currentLocation})
        .then((value) => print('location updated'))
        .catchError((e) {
          ErrorHandler().errorDialog(context, e);
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else if (_counter == 0) {
        onSosTap();
        _stopTimer();
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer({bool reset = true}) {
    if (reset) {
      _resetTimer();
    }
    _timer!.cancel();
  }

  void _resetTimer() => setState(() => _counter = maxSeconds);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Emergency",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Trueno',
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSpace(),
              Container(
                height: 300.0,
                width: 300.0,
                child: _buildBody(),
              ),
              _buildSpace(),
              SizedBox(height: 100),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildContainer(150 * _controller.value),
            _buildContainer(200 * _controller.value),
            _buildContainer(250 * _controller.value),
            _buildContainer(300 * _controller.value),
            _buildContainer(350 * _controller.value),
            Align(
              child: Text(
                '$_counter',
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: "Trueno"),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(1 - _controller.value),
      ),
    );
  }

  Widget _buildButtons() {
    final isRunning = _timer == null ? false : _timer!.isActive;
    return isRunning
        ? ButtonWidget(
            text: 'Cancel',
            color: Colors.white,
            backgroundColor: Colors.purple.shade700,
            onClicked: () {
              _stopTimer();
              Navigator.of(context).pop();
            },
          )
        : ButtonWidget(
            text: 'SOS',
            color: Colors.white,
            backgroundColor: Colors.red,
            onClicked: () {
              _startTimer();
            });
  }

  Widget _buildSpace() {
    return SizedBox(height: 10.0);
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.backgroundColor = Colors.purple,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shadowColor: Colors.purpleAccent,
          elevation: 3,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: StadiumBorder(),
          minimumSize: Size(250, 40),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}

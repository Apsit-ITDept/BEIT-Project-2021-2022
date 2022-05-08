// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

library dashboard;

import 'package:authentication/app/config/routes/app_pages.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/utils/services/service.dart';
import 'package:authentication/dashboard/dash.dart';
//import 'package:authentication/dashboard/Dashboard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// component
part '../components/sign_out_button.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 1.2,
            fit: BoxFit.fill,
            image: ExactAssetImage('assets/images/raster/Swipes.png'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Welcome to Swipes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    primary: Colors.deepPurpleAccent,

                    //sec: Colors.white,
                    onSurface: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              _buildSignOutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Obx(
      () => _SignOutButton(
        isLoading: controller.isLoading.value,
        onPressed: () => controller.signOut(),
      ),
    );
  }
}

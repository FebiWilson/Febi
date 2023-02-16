//import 'dart:html';

import 'package:febi/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: 400,
              height: 400,
              child: CustomPaint(
                painter: OpenPainter(),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              offset: Offset(2, 2),
                              blurRadius: 10.0),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Email (Required)",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password (Required)",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //       Container(
            //   margin: EdgeInsets.only(
            //     right: 25,
            //     left: 0,
            //     top: MediaQuery.of(context).size.height*0.7,
            //     bottom: 0,
            //     ),
            //     height: MediaQuery.of(context).size.width*0.60,
            //     width: MediaQuery.of(context).size.width*0.60,
            //     decoration: BoxDecoration(

            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(200),

            //     ),

            // ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.6,
                left: MediaQuery.of(context).size.width * 0.7,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Get.to(() => HomeView());
                    },
                    icon: Icon(
                      FontAwesomeIcons.angleRight,
                      size: 30,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: 25, top: MediaQuery.of(context).size.height * 0.94),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'REGISTER',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.2,
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color.fromARGB(255, 3, 3, 119),
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.7,
                //left: MediaQuery.of(context).size.width * 0.3,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "or Login with",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 38,
                      width: 200,
                      child: ElevatedButton.icon(
                        icon: Icon(FontAwesomeIcons.facebook),
                        label: Text('Login with Facebook'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      height: 38,
                      width: 200,
                      child: ElevatedButton.icon(
                        icon: Transform.scale(
                          scale: 1,
                          child: ImageIcon(
                            AssetImage("assets/image/g.png"),
                            size: 20,
                            
                          ),
                        ),
                        //icon: Icon(FontAwesomeIcons.googlePlusG),
                        label: Text('Sign in with Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 151, 246),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    //canvas.drawCircle(Offset(200, 200), 100, paint1);
    canvas.drawCircle(Offset(400, 130), 280, paint1);
    canvas.drawCircle(Offset(0, 820), 250, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

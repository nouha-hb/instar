import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'newpassword.dart';

class PasswordCODE extends StatelessWidget {
  String email;
  PasswordCODE({Key? key, this.email = ''}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (email.isNotEmpty) {
      _emailController.text = email;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              0.02.sw,
              0.02.sh,
              0.02.sw,
              0.02.sh,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
             
                SizedBox(
                  height: 0.04.sh,
                ),
                Center(
                  child: Text(
                    "Saisissez votre \n code ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27.0.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0.06.sw,
                    0.02.sh,
                    0.06.sw,
                    0.02.sh,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: Center(
                          child: TextField(
                            controller: _code,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  - - - - -",
                              hintStyle: TextStyle(
                                  fontSize: 20.0.sp,
                                  color: Colors.black,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextStyle(
                                fontSize: 16.0.sp,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.02.sh),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff58D954),
                            fixedSize: Size(190, 30),
                            textStyle: const TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onPressed: () async {
                    /*      bool togglepage = true;
                          UserMethods.verifierCode(_code.text.toString(),
                               _emailController.text, context,
                              togglepage: togglepage);
                              */

                      
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            0.01.sw,
                            0.0.sh,
                            0.01.sw,
                            0.01.sh,
                          ),
                          child: const Center(
                            child: Text(
                              "Suivant",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

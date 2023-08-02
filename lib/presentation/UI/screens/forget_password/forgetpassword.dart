import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';




class ForgetPassword extends StatelessWidget {
  String email;
  ForgetPassword({Key? key, this.email = ''}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (email.isNotEmpty) {
      _emailController.text = email;
    }
    return Scaffold(
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
                height: 0.2.sh,
              ),
        
              SizedBox(
                height: 0.04.sh,
              ),
              Text(
                " Saisissez votre \n Email",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0.sp,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              " - - - - - - - - - - - - - - - - - - - - -",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0.sp,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          fixedSize: Size(180, 40),
                          textStyle: const TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      onPressed: () async {
                      /*  UserMethods.renvoyerSMS(
                            "+216" + _emailController.text, context);
                        if (_emailController.text.isNotEmpty) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PasswordSMS(email: _emailController.text),
                            ),
                          );
                        } */
                        if (_emailController.text.isEmpty) {
                          displayToastMessage("Entrez votre email", context);
                        }
                  
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          0.01.sw,
                          0.005.sh,
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
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

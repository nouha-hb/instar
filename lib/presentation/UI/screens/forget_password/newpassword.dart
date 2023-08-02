
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';



class NewPassword extends StatelessWidget {
  String email ;
  NewPassword({Key? key,this.email=''}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _NewPasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(email.isNotEmpty) {
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
              Container(
                width: 0.45.sw,
                height: 0.4.sh,
                padding: EdgeInsets.fromLTRB(
                  0.02.sw,
                  0.02.sh,
                  0.02.sw,
                  0.02.sh,
                ),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Image(
                    image: AssetImage("assets/images/logo/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 0.00.sh,
              ),
              Text(
                "Entrer votre \n mot de passe",
                style: TextStyle(
                    fontSize: 27.0.sp,color: Colors.black,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0.06.sw,
                  0.01.sh,
                  0.06.sw,
                  0.02.sh,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(

                        controller: _NewPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                            hintText: "- - - - - - - - - -",
                            hintStyle: TextStyle(
                              color: Colors.black,
                                fontSize: 25.0.sp,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.bold),
                              ),
                        style:  TextStyle(
                            fontSize: 16.0.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.bold),
                      ),
                    ),


                       SizedBox(
                        height: 0.04.sh
                    ),


                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize:Size(180,20) ,
                          primary: Colors.black,
                          textStyle: const TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      onPressed: () async {
                        if (_NewPasswordController.text.length <8) {
                          displayToastMessage(
                              "Mot de Passe n'est pas valide", context);
                        }
                     /*   UserMethods.updatePassword(_emailController.text.toString(),_NewPasswordController.text, context);
                        print(_emailController.text.toString());
                        print(_NewPasswordController.text.toString());
                           */

                     /*   if (_passwordController.text.isEmpty) {

                          displayToastMessage(
                              "Le mot de passe est obligatoire.", context);
                        } else {
                          UserMethods.loginUser(_emailController.text, _passwordController.text, context);
                        }*/
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          0.01.sw,
                          0.00.sh,
                          0.01.sw,
                          0.01.sh,
                        ),
                        child: const Center(
                          child: Text(
                            "Confirmer",
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

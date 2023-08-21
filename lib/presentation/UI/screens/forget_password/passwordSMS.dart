import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
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
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 39.h,
              ),
              Text(
                "Saisissez votre code ",
                style: AppTextStyle.titleTextStyle,
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NumberInput(),
                    NumberInput(),
                    NumberInput(),
                    NumberInput(),
                  ],
                ),
              ),
                              SizedBox(height: 110.h,),

              PrimaryButton(
                  text: "Confirmer",
                  onClick: () {
                    // if (_code.text.length < 8) {
                    //   displayToastMessage(
                    //       "Mot de Passe n'est pas valide", context);
                    // }
                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => MainPage()));
                  }),
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

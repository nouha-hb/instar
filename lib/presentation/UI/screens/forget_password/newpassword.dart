import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/forget_password/passwordSMS.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';

class NewPassword extends StatelessWidget {
  String email;
  NewPassword({Key? key, this.email = ''}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _NewPasswordController = TextEditingController();
  String? requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return ("this field is required");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (email.isNotEmpty) {
      _emailController.text = email;
    }
    return Scaffold(
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
              "nouveau mot de passe",
              style: AppTextStyle.titleTextStyle,
            ),
            SizedBox(
              height: 30.h,
            ),
            ReusableTextField(
                text: "Nouveau mot de passe",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: requiredValidator,
                height: 60,
                width: 326),
                SizedBox(height: 110.h,),
            PrimaryButton(
                text: "Confirmer",
                onClick: () {
                  if (_NewPasswordController.text.length < 8) {
                    displayToastMessage(
                        "Mot de Passe n'est pas valide", context);
                  }
                 Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => PasswordCODE()));
                }),
          ],
        ),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/forget_password/newpassword.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';

import '../../../../core/style/colors.dart';

class ForgetPassword extends StatelessWidget {
  String email;
  ForgetPassword({Key? key, this.email = ''}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
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
      
      body: Column(
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
            "Mot de passe oublié",
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(
            height: 20.h,
          ),
          ReusableTextField(
              text: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: requiredValidator,
              height: 60,
              width: 326),
          SizedBox(height: 20.h),
          RichText(
            softWrap: true,
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "Veuillez saisir votre adresse e-mail\n",
                style: AppTextStyle.darkLabelTextStyle,
              ),
              TextSpan(
                text:
                    'Vous receverez un lien pour créer un nouveau mot de passe par e-mail',
                style: AppTextStyle.lightLabelTextStyle,
              )
            ]),
          ),
          SizedBox(height: 24.h,),
           PrimaryButton(
               text: "Envoyer",
               onClick: () {
                Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => NewPassword()));
               }),
          
        ],
      ),
    );
  }
}

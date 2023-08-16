import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';

import '../../../state_managment/controllers/profile_controller.dart';

class ChangePhone extends StatelessWidget {
  ChangePhone({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text("Modifier le numéro du téléphone"),
          centerTitle: true,
          foregroundColor: AppColors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<ProfileController>(
            init: ProfileController(),
            initState: (_) {},
            builder: (controller) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: ReusableTextField(
                            text: "télephone number",
                            controller: controller.phoneController,
                            keyboardType: TextInputType.number,
                            validator: controller.requiredPhoneValidator,
                            height: 40,
                            width: 326),
                      ),
                      SizedBox(
                        height: 110.h,
                      ),
                      PrimaryButton(
                          text: "Confirmer",
                          onClick: () {
                            // if (_code.text.length < 8) {
                            //   displayToastMessage(
                            //       "Mot de Passe n'est pas valide", context);
                            // }
                            controller.resetPhone();
                            Get.dialog(AlertDialog(
                              title: Text("phone number  changed "),
                            ));
                          }),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

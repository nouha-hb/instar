import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/presentation/UI/screens/my_profile/change_mobile_number.dart';
import 'package:instar/presentation/UI/screens/my_profile/change_password.dart';
import 'package:instar/presentation/UI/widgets/edit_profile_button.dart';
import 'package:instar/presentation/state_managment/controllers/profile_controller.dart';

import '../../widgets/custom_textform.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text("Mes informations"),
          centerTitle: true,
          foregroundColor: AppColors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                        height: 20.h,
                      ),
                      Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary)),
                        child: Center(
                          child: FlutterLogo(),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      EditProfileButton(
                        text: controller.username,
                        iconData: Icons.edit,
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              title: const Text('changer le nom'),
                              content: ReusableTextField(
                                controller: controller.usernameController,
                                height: 50,
                                keyboardType: TextInputType.name,
                                text: '',
                                validator: controller.requiredValidator,
                                width: 200,
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Confirmer"),
                                  onPressed: () {
                                    controller.change_name(controller
                                        .usernameController.text
                                        .toString());
                                    controller.resetName();
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      EditProfileButton(
                        text: controller.email,
                        iconData: Icons.edit,
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              title: const Text('changer email'),
                              content: ReusableTextField(
                                controller: controller.emailController,
                                height: 50,
                                keyboardType: TextInputType.name,
                                text: '',
                                validator: controller.requiredEmailValidator,
                                width: 200,
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Confirmer"),
                                  onPressed: () {
                                    controller.change_email(controller
                                        .emailController.text
                                        .toString());
                                    controller.resetEmail();

                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      EditProfileButton(
                        text: "changer le mot de passe",
                        iconData: Icons.arrow_forward_ios,
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangePassword()
                                  ));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      EditProfileButton(
                        text: "changer le numéro de téléphone",
                        iconData: Icons.arrow_forward_ios,
                        onTap: () {
                          Get.to(ChangePhone());
                        },
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

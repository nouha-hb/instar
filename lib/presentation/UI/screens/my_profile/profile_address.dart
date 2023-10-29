import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:instar/presentation/UI/screens/main_page/main_page.dart';
import 'package:instar/presentation/state_managment/controllers/profile_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

class ProfileAddress extends StatefulWidget {
  const ProfileAddress({super.key});

  @override
  State<ProfileAddress> createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.bgColor,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.darkGrey,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));
                },
              ),
              title: Text(
                "Mon adresse ",
                style: AppTextStyle.elementNameTextStyle,
              ),
              centerTitle: true,
            ),
            body: Container(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: TextFormField(
                          controller: controller.adrresseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.r),
                            ),

                            labelText: 'adresse'.tr,
                            hintText: 'adresse'.tr,
                            //icon: Icon(Icons.person),
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                        child: TextFormField(
                          controller: controller.gouvernoratController,
                          maxLength: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.r)),
                            labelText: 'gouvernorat'.tr,
                            hintText: 'gouvernorat'.tr,
                            //icon: Icon(Icons.person),
                            isDense: true,
                          ),
                          validator: (val) {
                            String patttern = r'(^[0-9]*$)';
                            RegExp regExp = RegExp(patttern);
                            if (val!.isEmpty) {
                              return 'MarkPlace_mobileV'.tr;
                            } else if (val.length != 10) {
                              return 'MarkPlace_MobileCV1'.tr;
                            } else if (!regExp.hasMatch(val)) {
                              return 'MarkPlace_MobileCV1'.tr;
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0.0-9.9]')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: TextFormField(
                          controller: controller.codePostalController,
                          maxLength: 6,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.r)),
                            labelText: 'ville'.tr,
                            hintText: 'ville'.tr,
                            //icon: Icon(Icons.person),
                            isDense: true,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return ''.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                        child: TextFormField(
                          controller: controller.codePostalController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.r)),
                            labelText: 'code postal'.tr,
                            hintText: 'code postal'.tr,
                            //icon: Icon(Icons.person),
                            isDense: true,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'MarkPlace_AddressV'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0.r),
                            ),
                          ),
                          onPressed: () async {},
                          child:
                              Text('Enregistre mon adresse'.tr.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

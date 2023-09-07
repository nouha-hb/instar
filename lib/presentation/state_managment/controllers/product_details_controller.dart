import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';

class ProductDetailsController extends GetxController {
  XFile? img;
  File? f;
  final ImagePicker _picker = ImagePicker();
  String fileName = '';

  String comment = '';

  void typeComment(String s) {
    comment = s;
    update();
  }


  //Clear image
  void clearImage() {
    f = null;
    img = null;
    fileName = '';
    update();
  }

  //Clear comment
  void clearComment() {
    comment = '';
    update();
  }

//pick image
  Future<void> pickImage(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text(
              'Upload image',
              style: AppTextStyle.subTitleTextStyle,
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () async {
                          img = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (img != null) {
                            f = File(img!.path);
                            fileName = basename(f!.path);
                          }
                          update();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.image,
                          size: 40,
                          color: AppColors.primary,
                        )),
                    IconButton(
                        onPressed: () async {
                          img = await _picker.pickImage(
                              source: ImageSource.camera);
                          if (img != null) f = File(img!.path);
                          fileName = basename(f!.path);
                          update();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: AppColors.primary,
                        )),
                  ]),
            ),
          ),
        );
      },
    );
  }
}

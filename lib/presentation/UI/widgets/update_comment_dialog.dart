import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/review.dart';
import 'package:instar/domain/usecases/review_usecases/update_review_usecase.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/custom_textform.dart';
import 'package:instar/presentation/state_managment/controllers/comment_controller.dart';
import 'package:path/path.dart';

class UpdateCommentDialog extends StatefulWidget {
  Review review;
  UpdateCommentDialog({super.key, required this.review});

  @override
  State<UpdateCommentDialog> createState() => _UpdateCommentDialogState();
}

class _UpdateCommentDialogState extends State<UpdateCommentDialog> {
  late TextEditingController textEditingController;
  XFile? img;
  File? f;
  final ImagePicker _picker = ImagePicker();
  String fileName = '';
  late CommentController commentController;
  @override
  void initState() {
    commentController = Get.find();
    textEditingController = TextEditingController();
    textEditingController.text = widget.review.comment;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      init: commentController,
      builder: (_) => AlertDialog(
        title: Text(
          'Update Comment',
          style: AppTextStyle.subTitleTextStyle,
        ),
        content: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Upload image',
                                style: AppTextStyle.subTitleTextStyle,
                              ),
                              content: Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            img = await _picker.pickImage(
                                                source: ImageSource.gallery);
                                            if (img != null) {
                                              setState(() {
                                                f = File(img!.path);
                                                fileName = basename(f!.path);
                                              });
                                            }
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
                                            if (img != null) {
                                              setState(() {
                                                f = File(img!.path);
                                                fileName = basename(f!.path);
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            size: 40,
                                            color: AppColors.primary,
                                          )),
                                    ]),
                              ),
                            );
                          });
                    },
                    child: f != null
                        ? Stack(children: [
                            Image.file(f!),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.review.image = '';
                                        f = null;
                                        img = null;
                                        fileName = "";
                                      });
                                    },
                                    icon: const Icon(Icons.clear)))
                          ])
                        : widget.review.image == ""
                            ? Image.asset('assets/images/add_image.png')
                            : Stack(
                                children: [
                                  Image.network(
                                      '${ApiConst.files}/${widget.review.image}'),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.review.image = '';
                                            });
                                          },
                                          icon: const Icon(Icons.clear)))
                                ],
                              ),
                    // onTap: ,
                  ),
                  TextField(
                    onChanged: (s) {
                      widget.review.comment = s;
                    },
                    minLines: 1,
                    maxLines: 3,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "write your comment",
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  PrimaryButton(
                      text: 'Update',
                      onClick: () async {
                        if (widget.review.comment != '') {
                          widget.review.image = fileName;
                          await commentController
                              .updateComment(widget.review)
                              .then((value) => Navigator.pop(context));
                        }
                      }),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel'))
                ],
              ),
            )),
      ),
    );
  }
}

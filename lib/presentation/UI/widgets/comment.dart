import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/review.dart';
import 'package:instar/domain/usecases/review_usecases/add_review_usecase.dart';
import 'package:instar/presentation/UI/screens/products/product_description.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:intl/intl.dart';

import '../../state_managment/controllers/product_desc_controller.dart';

class CommentWidget extends StatefulWidget {
  final String productId;

  const CommentWidget({Key? key, required this.productId}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late final ProductDescController controller;
  late final TextEditingController editingController;

  @override
  void initState() {
    controller = Get.find();
    editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDescController>(
      init: controller,
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 160.h,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) => ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.blue),
                  title: Text('title'),
                  subtitle: Text(
                      'subtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitle'),
                  trailing: Text('03-09-2023',
                      style: AppTextStyle.smallLightLabelTextStyle),
                ),
              )),
          controller.f != null
              ? Stack(children: [
                  Image.file(controller.f!),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            controller.clearImage();
                          },
                          icon: Icon(Icons.clear)))
                ])
              : Container(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (s) {
                controller.typeComment(s);
              },
              minLines: 1,
              maxLines: 3,
              controller: editingController,
              decoration: InputDecoration(
                hintText: "write your comment",
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: controller.comment.isEmpty
                            ? null
                            : () async {
                                // final DateTime now = DateTime.now();
                                // final DateFormat formatter =
                                //     DateFormat('yyyy-MM-dd');
                                // final String formatted =
                                //     formatter.format(now);
                                await AddReviewUsecase(sl())
                                    .call(Review(
                                        id: null,
                                        userID: SplashScreen.userToken.userId,
                                        productID: widget.productId,
                                        rating: 1,
                                        comment: controller.comment,
                                        image: controller.fileName ?? ''))
                                    .then((value) {
                                  controller
                                    ..clearComment()
                                    ..clearImage();
                                  editingController.clear();
                                });
                              },
                        icon: const Icon(Icons.send)),
                    IconButton(
                        onPressed: () {
                          controller.pickImage(context);
                        },
                        icon: const Icon(Icons.image_outlined)),
                  ],
                ),
              ),
            ),
          ), 
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}

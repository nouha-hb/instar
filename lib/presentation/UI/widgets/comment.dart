
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/core/constant/api_const.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/di.dart';
import 'package:instar/domain/entities/review.dart';
import 'package:instar/domain/usecases/review_usecases/add_review_usecase.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/UI/widgets/update_comment_dialog.dart';
import 'package:instar/presentation/state_managment/controllers/comment_controller.dart';
import 'package:intl/intl.dart';


class CommentWidget extends StatefulWidget {
  final String productId;

  const CommentWidget({Key? key, required this.productId}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late final CommentController controller;
  late final TextEditingController editingController;
  late final ScrollController scrollController;

  @override
  void initState() {
    controller = CommentController();
    editingController = TextEditingController();
    scrollController = ScrollController();
    controller.getComments(productId: widget.productId);
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      init: controller,
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              constraints: const BoxConstraints(
                  minHeight: 50, minWidth: double.infinity, maxHeight: 400),
              child: controller.comments.isEmpty
                  ? Text(
                      "no comments",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.lightLabelTextStyle,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: controller.comments.length,
                      itemBuilder: (_, index) {
                         // scrollController
                            // .jumpTo(scrollController.position.maxScrollExtent);
                        return PopupMenuButton(
                          onSelected: (value) async {
                            switch (value) {
                              case action.update:
                                await showDialog(
                                    context: context,
                                    builder: (ctx) => UpdateCommentDialog(
                                          review: controller.comments[index],
                                        ));
                                break;
                              case action.delete:
                                await controller.deletComment(
                                    controller.comments[index].id!);
                                break;
                            }
                          },
                          enableFeedback: true,
                          enabled: controller.comments[index].userID ==
                              SplashScreen.userToken.userId,
                          itemBuilder: ((context) => const [
                                PopupMenuItem(
                                  value: action.update,
                                  child: Text('update'),
                                ),
                                PopupMenuItem(
                                    value: action.delete, child: Text('delete'))
                              ]),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${ApiConst.files}/${controller.comments[index].userImage!}')),
                            title: Text(controller.comments[index].userName!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.comments[index].comment),
                                const SizedBox(
                                  height: 2,
                                ),
                                controller.comments[index].image == ''
                                    ? Container()
                                    : Image.network(
                                        '${ApiConst.files}/${controller.comments[index].image!}',
                                        height: 150,
                                      )
                              ],
                            ),
                            trailing: Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.comments[index].date!)
                                    .toString(),
                                style: AppTextStyle.smallLightLabelTextStyle),
                          ),
                        );
                      },
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
                          icon: const Icon(Icons.clear)))
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
                        onPressed: controller.comment == ''
                            ? null
                            : () async {
                                await AddReviewUsecase(sl())
                                    .call(Review(
                                        id: null,
                                        userID: SplashScreen.userToken.userId,
                                        productID: widget.productId,
                                        comment: controller.comment.trim(),
                                        image: controller.fileName))
                                    .then((value) {
                                  controller
                                    ..clearComment()
                                    ..clearImage()
                                    ..getComments(productId: widget.productId);
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
        ],
      ),
    );
  }
}

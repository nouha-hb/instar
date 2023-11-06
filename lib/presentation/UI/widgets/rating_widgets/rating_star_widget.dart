import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';

// ignore: must_be_immutable
class RatingStarWidget extends StatefulWidget {
  int index;
  RatingStarWidget({super.key, required this.index});

  @override
  State<RatingStarWidget> createState() => _RatingStarWidgetState();
}

late ProductDetailsController productDetailsController;

class _RatingStarWidgetState extends State<RatingStarWidget> {
  @override
  void initState() {
    productDetailsController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: AppColors.bgColor,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () async {
          if (productDetailsController.localRate == 0) {
            await productDetailsController.addRating(widget.index);
            productDetailsController.setRate(widget.index);
          } else if (widget.index == 1 &&
              productDetailsController.localRate == 1) {
            await productDetailsController
                .deleteRating(productDetailsController.userRate!.id!);
            productDetailsController.localRate == 0;
          } else {
            await productDetailsController.updateRating(widget.index);
          }
        },
        icon: productDetailsController.localRate > widget.index - 1
            ? const Icon(
                Icons.star,
                color: AppColors.primary,
              )
            : const Icon(Icons.star_border));
  }
}

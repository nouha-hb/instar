import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/widgets/rating_widgets/rating_star_widget.dart';
import 'package:instar/presentation/state_managment/controllers/product_details_controller.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

late ProductDetailsController productDetailsController;

class _RatingSectionState extends State<RatingSection> {
  @override
  void initState() {
    productDetailsController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productDetailsController.avgRate.toString(),
            style: AppTextStyle.ratingTextStyle,
          ),
          const SizedBox(
            width: 30,
          ),
          const VerticalDivider(
            width: 2.0,
            thickness: 2.0,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 30,
          ),
          RatingStarWidget(index: 1),
          RatingStarWidget(index: 2),
          RatingStarWidget(index: 3),
          RatingStarWidget(index: 4),
          RatingStarWidget(index: 5)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:badges/badges.dart' as badges;
import 'package:instar/presentation/UI/widgets/notification_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: true,
            backgroundColor: AppColors.bgColor,
            title: Text(
              "Brand",
              style: AppTextStyle.elementNameTextStyle,
            ),
            centerTitle: true,
            actions: [NotificationWidget()],
          ),
          // SliverToBoxAdapter(
          //   child: Column(children: [
          //     Image.asset(
          //       "assets/images/indar.png",
          //       width: 200,
          //       height: 100,
          //     )
          //   ]),
          // )
        ],
      ),
    );
  }
}

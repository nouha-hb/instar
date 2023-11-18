import 'package:flutter/material.dart';
import 'package:instar/core/style/colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            )),
        const Positioned(
          right: 16,
          top: 16,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 4,
          ),
        )
      ],
    );
  }
}

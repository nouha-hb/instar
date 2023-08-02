import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/invoice_list_item.dart';

import '../../widgets/profile_infos_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
          //title: Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'General Informations:',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                const ProfileInformationsCard(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Invoices: ',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(
                      5,
                      (index) => const InvoiceListItem(
                            invoiceId: 'jhjkh656kljLK4ML',
                            invoiceDate: '23-3-2023',
                          )),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: MyButton(
                    text: 'Log Out',
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

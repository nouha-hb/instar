import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInformationsCard extends StatelessWidget {
  const ProfileInformationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 6,
        // color: Color.fromARGB(255, 236, 236, 236),
        child: Padding(
          padding: EdgeInsets.only(
              right: 0.0.w, left: 12.0.w, top: 12.0.w, bottom: 12.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                width: 110.w,
                height: 150.h,
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yassine Ajroud',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'ajroudyassine06@gmail.com',
                    style: TextStyle(
                        fontSize: 10.sp, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'male',
                    style: TextStyle(
                        fontSize: 10.sp, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "M'saken - Sousse",
                    style: TextStyle(
                        fontSize: 10.sp, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '55 332 620',
                    style: TextStyle(
                        fontSize: 10.sp, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 15.w,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

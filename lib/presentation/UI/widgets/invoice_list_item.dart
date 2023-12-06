import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceListItem extends StatelessWidget {
  final String invoiceId;
  final String invoiceDate;
  const InvoiceListItem(
      {super.key, required this.invoiceDate, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              invoiceId,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.normal),
            ),
            Text(
              invoiceDate,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}

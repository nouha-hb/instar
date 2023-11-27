import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/fournisseur.dart';

class ProviderItem extends StatelessWidget {
  final Fournisseur provider;
  const ProviderItem({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        height: 70.h,
         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
         child:Padding(
           padding: const EdgeInsets.symmetric(vertical:8.0 ,horizontal: 20),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(provider.name,style: AppTextStyle.elementNameTextStyle,),
             const Icon(Icons.arrow_forward_ios,color:Colors.black)
            ]),
         )
    ),
    );
  }
}
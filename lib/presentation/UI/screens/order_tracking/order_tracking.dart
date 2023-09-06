import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/l10n/plural_strings.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/Product3D.dart';
import 'package:instar/domain/entities/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instar/presentation/UI/screens/main_page/shopping_cart.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';
import 'package:instar/presentation/UI/widgets/step_item.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    int items = 2;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
            size: 30.sp,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.order_tracking,
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShoppingList())),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.black,
              size: 30.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.order_items,
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                      Text(
                        PluralStrings.numberOfItems(items,
                            context), //AppLocalizations.of(context)!.order_items,
                        style: AppTextStyle.greySubTitleTextStyle,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<Widget>.generate(
                          items,
                          (index) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ProductComponent(
                                  product: Product(
                                      category: 'category',
                                      id: 'id',
                                      name: 'name',
                                      description: 'description',
                                      price: 12,
                                      quantity: 2,
                                      subCategory: 'subCategory',
                                      image:
                                          'tea-table-3d-model-low-poly-obj-fbx-ma-gltf-usdz.jpg',
                                      image3D: [
                                    Product3D(
                                        model3D: 'TeaTable01.glb',
                                        texture:
                                            'istockphoto-1373075432-612x612.jpg',
                                        quantity: 2,
                                        id: 'id')
                                  ])))),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.track_package,
                    style: AppTextStyle.subTitleTextStyle,
                  ),
                  Stepper(
                      currentStep: 2,
                      onStepContinue: null,
                      onStepCancel: null,
                      controlsBuilder: (context, details) => Container(),
                      steps: [
                        StepItem.makeStep(
                            title: AppLocalizations.of(context)!
                                .order_confirmation,
                            location: 'Tuinis, Tunisie',
                            date: "12:30 11/03/2023",
                            context: context),
                        StepItem.makeStep(
                            title:
                                AppLocalizations.of(context)!.ongoing_treatment,
                            location: 'Tuinis, Tunisie',
                            date: "12:30 11/03/2023",
                            context: context),
                        StepItem.makeStep(
                            title: AppLocalizations.of(context)!.in_preparation,
                            location: 'Tuinis, Tunisie',
                            date: "12:30 11/03/2023",
                            context: context),
                        StepItem.makeStep(
                            title: AppLocalizations.of(context)!.shipping,
                            location: '',
                            date: "",
                            context: context),
                        StepItem.makeStep(
                            title: AppLocalizations.of(context)!.delivery,
                            location: '',
                            date: "",
                            context: context)
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}

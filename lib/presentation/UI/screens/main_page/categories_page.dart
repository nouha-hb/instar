import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/domain/entities/category.dart';
import 'package:instar/domain/usecases/category_usecases/get_categories_usecase.dart';
import 'package:instar/presentation/UI/widgets/categroy_component.dart';

import '../../../../core/style/colors.dart';
import '../../../../di.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // List category_names = [
    //   "Literie",
    //   "Enfant",
    //   "Cuisine",
    //   "Salon",
    //   "Salle de bain",
    //   "Décoration"
    // ];
    List image_svg_names = [
      Assets.categorie_literie,
      Assets.categorie_enfants,
      Assets.categorie_cuisine,
      Assets.categorie_salon,
      Assets.categorie_salle_de_bain,
      Assets.categorie_decoration
    ];
    List <Category> categoryList = [];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: FutureBuilder(
              future: GetAllCategoriesUsecase(sl()).call(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final res = snapshot.data;

                  print('data  category r= $res');
                  res!.fold((l) {
                    print("left categoryssss");
                    return null;
                  }, (r) {
                    categoryList = r;
                    print('rightttttttt ' + categoryList.toString());
                  });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return categoryList.isEmpty
                    ? Text("no category")
                    : Container(
                        //width: MediaQuery.sizeOf(context).width,
                        height: 120.h,

                        decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.length,
                            itemBuilder: (_, index) => Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: CategoryComponeny(
                                      width: 100.w,
                                      height: 90.h,
                                      image_path: image_svg_names[index],
                                      category_name:
                                          categoryList[index].name),
                                )),
                      );
              },
            ),

            // GridView.builder(
            //   gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            //     mainAxisSpacing: 20.0.w,
            //           crossAxisSpacing: 20.0.h,
            //           ),

            //   itemCount: category_names.length,
            //   itemBuilder: (BuildContext ctx, index) {
            //     return CategoryComponeny(
            //       width: 155.w,
            //       height: 180.h,
            //         image_path: image_svg_names[index],
            //         category_name: category_names[index]);
            //   }),
            // ),
          ),
        ],
      ),
    );
  }
}

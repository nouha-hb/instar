import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instar/core/style/assets.dart';
import 'package:instar/presentation/UI/widgets/categroy_component.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List category_names = [
      "Literie",
      "Enfant",
      "Cuisine",
      "Salon",
      "Salle de bain",
      "Décoration"
    ];
    List image_svg_names = [
      Assets.categorie_literie,
      Assets.categorie_enfants,
      Assets.categorie_cuisine,
      Assets.categorie_salon,
      Assets.categorie_salle_de_bain,
      Assets.categorie_decoration
    ];

    return Center(
      child: SizedBox
      (width: MediaQuery.sizeOf(context).width*0.9,
      height: 550.h,
        child: GridView.builder(
        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
          mainAxisSpacing: 20.0.w,
                crossAxisSpacing: 20.0.h,
                ),
           
        itemCount: category_names.length,
        itemBuilder: (BuildContext ctx, index) {
          return CategoryComponeny(
              image_path: image_svg_names[index],
              category_name: category_names[index]);
        }),
      ),
    );
  }
}

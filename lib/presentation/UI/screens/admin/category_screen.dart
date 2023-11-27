import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/state_managment/category_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/product.dart';
import '../../widgets/product_component.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  final List<Product> allProducts;
  const CategoryScreen({super.key,required this.category,required this.allProducts});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(
      init: CategoryPageController(),
     
      builder:(c) {
                  c.getProductsByCategory(category.name, allProducts);

        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: 
                 CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
                  automaticallyImplyLeading: true,
                  floating: true,
                  pinned: true,
                  snap: true,
                  backgroundColor: AppColors.bgColor,
                  title: Text(
                                category.name,
                                style: AppTextStyle.elementNameTextStyle,
                              ),
                  centerTitle: true,
                //  actions: const [NotificationWidget()],
                
                ),
      
                  SliverPadding(
                                padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
              
                    sliver: SliverGrid(delegate:
                    SliverChildBuilderDelegate(
                      childCount: c.products.length,
                      (context, index) {
                     return ProductComponent(product: c.products[index],);
                            }),
                          
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:0.65,
                          ),),
                  )          
                 ])
          
              );
      },
    );}
          }


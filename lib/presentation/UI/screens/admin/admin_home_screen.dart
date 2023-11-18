import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/domain/entities/fournisseur.dart';
import 'package:instar/presentation/UI/screens/admin/category_screen.dart';
import 'package:instar/presentation/UI/screens/splash_screen/splash_screen.dart';
import 'package:instar/presentation/UI/widgets/category_item.dart';
import 'package:instar/presentation/UI/widgets/notification_widget.dart';
import 'package:instar/presentation/UI/widgets/product_component.dart';

import '../../../state_managment/controllers/admin_home_controller.dart';

class AdminHomeScreen extends StatelessWidget {
  final Fournisseur provider;
   AdminHomeScreen({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AdminHomeController(),
      builder:(c)=> Scaffold(
        backgroundColor: AppColors.bgColor,
        body: FutureBuilder(
          future: c.loadProviderData(provider.id),
          builder: (ctx,snapshot){
            if(snapshot.hasData && c.products.isNotEmpty){
              return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: SplashScreen.currentUser.role!='admin'? IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();}):Container() ,
                automaticallyImplyLeading:false,
                floating: true,
                pinned: true,
                snap: true,
                backgroundColor: AppColors.bgColor,
                title: Text(
                              c.provider.name,
                              style: AppTextStyle.elementNameTextStyle,
                            ),
                centerTitle: true,
                actions: const [NotificationWidget()],
              ),
               SliverPadding(
                padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                 sliver: SliverToBoxAdapter(
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          "assets/images/avatar.png",
                         width: 400.w,
                         height: 100.h,
                          fit: BoxFit.fill,
                                     ),
                      )
                   ]),
                 ),
               ),
                 SliverToBoxAdapter(
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:14.0),
                      child:  Row(
                        children: List<Widget>.generate(c.providerCategories.length, (index) =>InkWell(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CategoryScreen(category: c.providerCategories[index], allProducts: c.products)));},
                          child: CategoryItem(image: "https://www.paradis-deco.tn/wp-content/uploads/2021/11/CH-04.jpg", title: c.providerCategories[index].name)) )//[
                          //     CategoryItem(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMlJ_h651EiOV54zLY4rn5ifVPyz2l7YkD4Ek7fF9JLwaBRLMBeGDD1FC4TcgY8l2fMws&usqp=CAU', title: 'literie'),
                          //   CategoryItem(image: 'https://www.paradis-deco.tn/wp-content/uploads/2021/11/CH-04.jpg', title: 'enfant'),
                           //  CategoryItem(image: 'https://www.cuisines-aviva.com/storage/medias/26/a4/54185/conversions/bcbg-arezzo-marbre-scuro-2023-vue-2-paysage.jpg-crop-full.jpg', title: 'cuisine'),
                             // CategoryItem(image: 'https://www.lejournaldelamaison.fr/wp-content/uploads/sites/8/2022/05/tapis-cosy-shopping-365x200.jpg', title: 'salon'),
                                  
                      //]
                      ),
                    ),
                  )
                        ),
                        
               SliverPadding(
                padding:const EdgeInsets.only(left:20,right: 20,top: 20,bottom: 5),
                 sliver: SliverToBoxAdapter(child: Text(
                                        "All products",
                                        style: AppTextStyle.subTitleTextStyle,
                                      ),),
               ),
                SliverPadding(
                              padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
            
                  sliver: SliverGrid(delegate:
                  SliverChildBuilderDelegate(
                    childCount: c.products.length,
                    (context, index) {
                  return ProductComponent(product: c.products[index]);
                          }),
                        
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:0.65,
                        ),),
                )          
               ]);

            }else if (snapshot.connectionState==ConnectionState.waiting){
              return  const Center(child: CircularProgressIndicator(),);
            }else{
              return  const Center(child: Text("error"),);
            }
          },


        )),
    );
    
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/screens/admin/admin_home_screen.dart';
import 'package:instar/presentation/state_managment/controllers/providers_screen_controller.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

import '../../widgets/provider_item.dart';

class Providersscreen extends StatelessWidget {
  const Providersscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersScreenController>(
      init: ProvidersScreenController(),
     
      builder:(c) {
                  //c.getProductsByCategory(category.name, allProducts);

        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: 
                 FutureBuilder(

                  future:c.getAllProviders() ,
                  builder: (ctx,snapshot){
                    if(snapshot.hasData){
return CustomScrollView(
                               slivers: [
                                 SliverAppBar(
                    leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
                    automaticallyImplyLeading: true,
                    floating: true,
                    pinned: true,
                    snap: true,
                    backgroundColor: AppColors.bgColor,
                    title: Text(
                                  'our brands',
                                  style: AppTextStyle.elementNameTextStyle,
                                ),
                    centerTitle: true,
                                 //  actions: const [NotificationWidget()],
                                 
                                 ),
                       
                    SliverPadding(
                                  padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                               
                      sliver: SliverList(delegate:
                      SliverChildBuilderDelegate(
                        childCount: c.providers.length,//c.products.length,
                        (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AdminHomeScreen(provider: c.providers[index])));
                        },
                        child: ProviderItem(provider:c.providers[index]));
                              }),
                            
                      
                    )   )       
                   ]);
                    }else if(snapshot.connectionState==ConnectionState.waiting){
                     return const Center(child: CircularProgressIndicator(),);
                    }else{
                      return const Center(child: Text('error'),);
                    }

                  },

                 )
          
              );
      },
    );}
          }


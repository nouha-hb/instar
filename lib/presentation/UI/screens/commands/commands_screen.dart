import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instar/presentation/UI/screens/order_tracking/order_tracking.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../../state_managment/controllers/reclamations_controller.dart';
import '../../widgets/command_Item.dart';

class CommandsScreen extends StatelessWidget {
  const CommandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RaclamationsController(),
      builder:(c)=> Scaffold(
            backgroundColor: AppColors.bgColor,
            body: 
                   FutureBuilder(
                    future: c.getCommands(),
                    builder: (ctx,snapashot){
                      if(snapashot.hasData){
                        return  CustomScrollView(
                                 slivers: [
                                   SliverAppBar(
                      leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
                      automaticallyImplyLeading: true,
                      floating: true,
                      pinned: true,
                      snap: true,
                      backgroundColor: AppColors.bgColor,
                      title: Text(
                                    'Mes achats',
                                    style: AppTextStyle.elementNameTextStyle,
                                  ),
                      centerTitle: true,
                                   //  actions: const [NotificationWidget()],
                                   
                                   ),
                         
                                 
                        SliverList.builder(
                          itemCount: c.commands.length,
                          itemBuilder: (context, index) {
                         return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderTrackingScreen(reclamation:  c.commands[index])));
                          },
                          child: CommandItem(index: index+1,reference:  c.commands[index].reference,date:  c.commands[index].date,price:  c.commands[index].price,));
                                })
                        
                      
                     ]);
                      }else if (snapashot.connectionState==ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator(),);

                      }else{
                                                return const Center(child: Text('error'),);

                      }
                    },

                   )
            
                ),
    );
  }
}
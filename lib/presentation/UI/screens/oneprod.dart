import 'package:flutter/material.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';

import '../../../di.dart';

class OneProductScreen extends StatelessWidget {
  const OneProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: GetOneProductsUsecase(sl()).call('64c7f90d429186e31da21664'),
          builder: (_, snap) {
            if (snap.hasData) {
              final prod = snap.data;
              print(prod);
              return prod!.fold((l) => Text(l.message.toString()), (r) {
              
                      return ListTile(
                          title: Text(
                       r.name.toString(),
                      ));
                  
              });
            } else if (snap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Text('error');
            }
          }),
      //floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}

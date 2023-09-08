import 'package:flutter/material.dart';
import 'package:instar/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_subcategory_usecase.dart';

import '../../../di.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: GetProductsBySubCategoryUsecase(sl()).call('enfant','table'),
          builder: (_, snap) {
            if (snap.hasData) {
              final list = snap.data;
              print(list);
              return list!.fold((l) => Text(l.message.toString()), (r) {
                return ListView.builder(
                    itemCount: r.length,
                    itemBuilder: (_, i) {
                      return ListTile(
                          title: Text(
                        r[i].name.toString(),
                      ));
                    });
              });
            } else if (snap.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text('error');
            }
          }),
      //floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}

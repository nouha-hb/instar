import 'package:flutter/material.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_category_usecase.dart';

import '../../../di.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future:GetProductsByCategoryUsecase(sl()).call('enfant'),
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
                        r[i].category
                      ));
                    });
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

import 'package:flutter/material.dart';
import 'package:instar/domain/usecases/authentication_usecases/get_user_usecase.dart';

import '../../../di.dart';
import '../../../domain/entities/user.dart';

class DemoProfil extends StatefulWidget {
  const DemoProfil({super.key});

  @override
  State<DemoProfil> createState() => _DemoProfilState();
}

class _DemoProfilState extends State<DemoProfil> {
  late TextEditingController name;

  late TextEditingController lname;

  late TextEditingController email;

  late TextEditingController phone;

  @override
  void initState() {
    name = TextEditingController();
    lname = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    lname.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: GetUserUsecase(sl()).call("id"),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final res = snapshot.data;
              res!.fold((l) {
                return Center(child: Text('error'));
              }, (r) {
                return Center(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: name,
                        ),
                        TextFormField(
                          controller: lname,
                        ),
                        TextFormField(
                          controller: email,
                        ),
                        TextFormField(
                          controller: phone,
                        ),
                      ],
                    ),
                  ),
                );
              });
             
            } return Center(child: Text('text'));
          }),
    );
  }
}

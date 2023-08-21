import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instar/core/style/colors.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:instar/presentation/UI/widgets/custom_button.dart';
import 'package:instar/presentation/UI/widgets/language_item.dart';
import 'package:instar/presentation/state_managment/settings_controller.dart';
import 'package:provider/provider.dart';

import '../main_page/main_page.dart';

class SelectLanguageScreent extends StatelessWidget {
  const SelectLanguageScreent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: Text(
          AppLocalizations.of(context)!.lang,
          style: AppTextStyle.elementNameTextStyle,
        ),
      ),
      body: Column(
        children: [
          LanguageItem(
            language: AppLocalizations.of(context)!.fr,
            value: 0,
            gvalue:
                Provider.of<SettingsController>(context, listen: true).language,
            onChanged: (v) {
              Provider.of<SettingsController>(context, listen: false)
                  .setLocale(Locale('fr'), 0);
            },
          ),
          LanguageItem(
              language: AppLocalizations.of(context)!.en,
              value: 1,
              gvalue: Provider.of<SettingsController>(context, listen: true)
                  .language,
              onChanged: (v) {
                Provider.of<SettingsController>(context, listen: false)
                    .setLocale(Locale('en'), 1);
              }),
          LanguageItem(
            language: AppLocalizations.of(context)!.ar,
            value: 2,
            gvalue:
                Provider.of<SettingsController>(context, listen: true).language,
            onChanged: (v) {
              Provider.of<SettingsController>(context, listen: false)
                  .setLocale(Locale('ar'), 2);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          PrimaryButton(
              text: "save",
              onClick: () {
                Provider.of<SettingsController>(context, listen: false)
                    .saveLanguage(
                        Provider.of<SettingsController>(context, listen: false)
                            .language);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => MainPage()));
              })
        ],
      ),
    );
  }
}

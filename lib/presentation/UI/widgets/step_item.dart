import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StepItem {
  static Step makeStep(
      {required String title,
      required String location,
      required String date,
      required BuildContext context}) {
    return Step(
        isActive: title == AppLocalizations.of(context)!.in_preparation
            ? true
            : false,
        title: Text(title),
        content: const SizedBox(),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(location),
            Text(date),
          ],
        ));
  }
}

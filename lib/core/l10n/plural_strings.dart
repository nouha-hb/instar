import 'package:flutter/material.dart';
import 'package:instar/core/style/text_style.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PluralStrings {
  static String numberOfItems(int number, BuildContext context) => Intl.plural(
        number,
        one: AppLocalizations.of(context)!.item,
        other: "$number ${AppLocalizations.of(context)!.items}",
        name: "itemsnumber",
        args: [number],
      );

  static Text onOrder(int number, BuildContext context) {
    Text res;
    switch (number) {
      case -1:
        res = Text(AppLocalizations.of(context)!.by_order,style: AppTextStyle.onstockTextStyle);
        break;
      case 0:
        res = Text(AppLocalizations.of(context)!.out_of_stock,style: AppTextStyle.outofstockTextStyle);
        break;
      default:
        res = Text(AppLocalizations.of(context)!.on_stock,style: AppTextStyle.onstockTextStyle);
        break;
    }
    return res;
  }
}

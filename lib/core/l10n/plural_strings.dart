import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PluralStrings{

static String numberOfItems(int number,BuildContext context) =>
Intl.plural(number,
one: AppLocalizations.of(context)!.item,
other: "$number ${AppLocalizations.of(context)!.items}",
name: "itemsnumber",
args: [number],
);


}
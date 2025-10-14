// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get textSimple => 'Einfacher Text';

  @override
  String textWithParams(int amount, String comment) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.compactCurrency(locale: localeName, decimalDigits: 2);
    final String amountString = amountNumberFormat.format(amount);

    return 'Text mit Parametern: $amountString $comment';
  }

  @override
  String textWithDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Text mit Datum: $dateString';
  }

  @override
  String textPlural(num howMany) {
    String _temp0 = intl.Intl.pluralLogic(
      howMany,
      locale: localeName,
      other: '$howMany klicks',
      many: '$howMany klicks',
      few: '$howMany klicks',
      two: '$howMany klicks',
      one: '$howMany Klick',
      zero: 'Keine Klicks',
    );
    return '$_temp0';
  }

  @override
  String get screenTitle => 'Phrase für das Flutter-Demoprojekt';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get textSimple => 'Simple Text';

  @override
  String textWithParams(int amount, String comment) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.compactCurrency(locale: localeName, decimalDigits: 2);
    final String amountString = amountNumberFormat.format(amount);

    return 'Text with parameters: $amountString $comment';
  }

  @override
  String textWithDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Text with date: $dateString';
  }

  @override
  String textPlural(num howMany) {
    String _temp0 = intl.Intl.pluralLogic(
      howMany,
      locale: localeName,
      other: '$howMany clicks',
      many: '$howMany clicks',
      few: '$howMany clicks',
      two: '$howMany clicks',
      one: '$howMany click',
      zero: 'No clicks',
    );
    return '$_temp0';
  }

  @override
  String get screenTitle => 'Phrase for Flutter Demo Project';
}

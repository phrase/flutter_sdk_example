import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:phrase/phrase.dart';

class _PhraseLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
	const _PhraseLocalizationsDelegate();
	@override
	Future<AppLocalizations> load(Locale locale) => AppLocalizations.delegate.load(locale).then((fallback) => PhraseLocalizations(locale.toString(), fallback)).whenComplete(() => Phrase.onLocale(locale));
	@override
	bool isSupported(Locale locale) => AppLocalizations.supportedLocales.contains(locale);
	@override
	bool shouldReload(_PhraseLocalizationsDelegate old) => false;
}

extension AppLocalizationsX on AppLocalizations {
	String getText(String key, {Map<String, dynamic> args = const {}, String? fallbackValue}) {
		final value = Phrase.getText(localeName, key, args);
		if (value != null) return value;
		if (fallbackValue != null) return fallbackValue;
		return (this as PhraseLocalizations).useFallback(key, args, fallbackValue);
	}
}

class PhraseLocalizations extends AppLocalizations {
	PhraseLocalizations(String locale, AppLocalizations fallback) : _fallback = fallback, super(locale);
	final AppLocalizations _fallback;

	static const LocalizationsDelegate<AppLocalizations> delegate = _PhraseLocalizationsDelegate();
	static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
		delegate,
		GlobalMaterialLocalizations.delegate,
		GlobalCupertinoLocalizations.delegate,
		GlobalWidgetsLocalizations.delegate,
	];
	static const List<Locale> supportedLocales = AppLocalizations.supportedLocales;

	String useFallback(String key, Map<String, dynamic> args, String? fallbackValue) {
		switch (key) {
			case 'textSimple':
				return _fallback.textSimple;
			case 'textWithParams':
				return _fallback.textWithParams(args['amount'], args['comment']);
			case 'textWithDate':
				return _fallback.textWithDate(args['date']);
			case 'textPlural':
				return _fallback.textPlural(args['howMany']);
			case 'screenTitle':
				return _fallback.screenTitle;
			default:
				if (fallbackValue != null) return fallbackValue;
				return 'Translation missing for key "$key"';
		}
	}

	@override
	String get textSimple => Phrase.getText(localeName, 'textSimple') ?? _fallback.textSimple;
	@override
	String textWithParams(int amount, String comment) => Phrase.getText(localeName, 'textWithParams', {'amount':amount, 'comment':comment}) ?? _fallback.textWithParams(amount, comment);
	@override
	String textWithDate(DateTime date) => Phrase.getText(localeName, 'textWithDate', {'date':date}) ?? _fallback.textWithDate(date);
	@override
	String textPlural(num howMany) => Phrase.getText(localeName, 'textPlural', {'howMany':howMany}) ?? _fallback.textPlural(howMany);
	@override
	String get screenTitle => Phrase.getText(localeName, 'screenTitle') ?? _fallback.screenTitle;
}

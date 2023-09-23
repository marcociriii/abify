import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['it', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? itText = '',
    String? enText = '',
  }) =>
      [itText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '3e0hlo3o': {
      'it': 'Nuovo',
      'en': 'New',
    },
    '24o3rnx5': {
      'it': 'Da fare',
      'en': 'Todo',
    },
    'jp4tjkc4': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // NuovaTask
  {
    'fzfwurao': {
      'it': 'Nome Task',
      'en': '',
    },
    'crvm2trw': {
      'it': 'Scegli il nome della tua Task',
      'en': '',
    },
    'r5x83z9n': {
      'it': 'Scegli uno o più tag da associare (opzionale)',
      'en': '',
    },
    'jbh4kf36': {
      'it': '+ Nuova Tag',
      'en': '',
    },
    '969trnng': {
      'it': 'Scegli una data di inizio',
      'en': '',
    },
    'nk1o62p1': {
      'it': 'Tempo previsto per completare la Task',
      'en': '',
    },
    '34o3g17n': {
      'it': 'Non specificato',
      'en': '',
    },
    '79vkjsv9': {
      'it': '30 minuti',
      'en': '',
    },
    'iroajowm': {
      'it': '1 ora',
      'en': '',
    },
    'jhkn1mlu': {
      'it': '2 ore',
      'en': '',
    },
    'h7onuye2': {
      'it': 'Durata personalizzata',
      'en': '',
    },
    '8wqxvkah': {
      'it': 'Scegli un colore per la Task',
      'en': '',
    },
    '5gvdj8uz': {
      'it': 'Scegli un icona per la task',
      'en': '',
    },
    'qmbnwhim': {
      'it': 'Nuova Task',
      'en': 'New Task',
    },
    '8cfx9d4g': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // NuovoTag
  {
    'n8ffjifo': {
      'it': 'Nome nuova Tag',
      'en': '',
    },
    'eqvttls7': {
      'it': 'Scegli il nome della tua Tag',
      'en': '',
    },
    'i9jy43j0': {
      'it': 'Per eliminare una Tag già esistente, tieni premuto sulla Tag',
      'en': '',
    },
    'y3v0plk3': {
      'it': 'Crea Tag',
      'en': '',
    },
  },
  // RimuoviTag
  {
    'a1purip9': {
      'it':
          'Eliminando il Tag, tutte le Task che hanno questo Tag, rimarranno senza il Tag. Sicuro di voler continuare?',
      'en': '',
    },
    'awd1dkfv': {
      'it': 'ELIMINA IL TAG',
      'en': '',
    },
    '8je9l8j2': {
      'it': 'Annulla',
      'en': '',
    },
  },
  // ListaVuota
  {
    '1s6ok7l1': {
      'it': 'Nessuna Task per oggi!',
      'en': '',
    },
    'cd134f27': {
      'it':
          'Hai completato tutte le Task per oggi. Puoi crearne delle nuove cliccando su + Nuova in basso.',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '29tnwqdl': {
      'it': '',
      'en': '',
    },
    '7uk4v24t': {
      'it': '',
      'en': '',
    },
    'g7mnpefm': {
      'it': '',
      'en': '',
    },
    '0yznm28m': {
      'it': '',
      'en': '',
    },
    'oq1co14c': {
      'it': '',
      'en': '',
    },
    'v43bd5nr': {
      'it': '',
      'en': '',
    },
    'vzqrvcy7': {
      'it': '',
      'en': '',
    },
    '03moxv09': {
      'it': '',
      'en': '',
    },
    'rkdebdui': {
      'it': '',
      'en': '',
    },
    'oaaqdxk8': {
      'it': '',
      'en': '',
    },
    'seqwsohe': {
      'it': '',
      'en': '',
    },
    'rco3l7x6': {
      'it': '',
      'en': '',
    },
    'wblssky9': {
      'it': '',
      'en': '',
    },
    '2sshqvry': {
      'it': '',
      'en': '',
    },
    '4wkf2lo9': {
      'it': '',
      'en': '',
    },
    'mze7iphj': {
      'it': '',
      'en': '',
    },
    'kyu5xocz': {
      'it': '',
      'en': '',
    },
    'p5700gww': {
      'it': '',
      'en': '',
    },
    'ccx16pfg': {
      'it': '',
      'en': '',
    },
    '6qammg68': {
      'it': '',
      'en': '',
    },
    'wuuj17hk': {
      'it': '',
      'en': '',
    },
    'tfhs22ji': {
      'it': '',
      'en': '',
    },
    'a4g3j8ej': {
      'it': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

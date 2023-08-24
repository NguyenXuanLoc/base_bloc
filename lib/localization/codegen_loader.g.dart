// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class Applocalizations extends AssetLoader {
  const Applocalizations();

  static const enCode = 'en';
  static const plCode = 'pl';
  static const localeEn = Locale(enCode);
  static const localePl = Locale(plCode);
  static const List<Locale> supportedLocales = <Locale>[localeEn, localePl];

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "title": "Poland",
    "I_confirm_that_the_given_account_is_my_personal_account": "Potwierdzam, że podane konto jest moim kontem osobistym, jest publiczne oraz ma co najmniej  250 obserwujących",
    "I_accept_the_terms_of_use": "Akceptuję warunki korzystania",
    "We_recommend_using_a_different_password_than_your_Instagram_account": "Zalecamy użycie innego hasła niż do konta na Instagramie.",
    "Password": "Hasło",
    "Your_Instagram_name": "Twoja nazwa na Instagramie",
    "your_email": "Twój e-mail",
    "Join_Swayme": "Dołącz do Swayme!",
    "out_of": "out of",
    "steps": "steps",
    "I_already_have_an_account": "Mam już konto",
    "Email_registration": "Rejestracja przez e-mail",
    "Registration_with_a_phone_number": "Rejestracja z numerem telefonu",
    "Continue_with_Apple_ID": "Kontynuuj z Apple ID",
    "Register_with_Facebook": "Zarejestruj się przez Facebook",
    "Join_us_and_strengthen_your_influence":
        "Dołącz do nas i wzmocnij swój wpływ",
    "go_to_the_application": "Przejdź do aplikacji",
    "getting_discounts_has_never_been_so_fun":
        "Zdobywanie zniżek jeszcze nigdy nie było tak przyjemne!",
    "promote_your_favourite_brands_through_your_instagram":
        "Promuj ulubione marki przez swojego Instagrama",
    "find_your_favourite_restaurants_and_discover":
        "Znajduj swoje ulubione restauracje  i odkrywaj nowe!",
    "get_discounts_from_the_best":
        "Zgarniaj zniżki z najlepszych miejsc na mieście",
    "push_photos_on_your_stories": "Wstawiaj zdjęcia na swoje story  i zyskuj!",
    "find_collaborations_that": "Znajduj współprace które są w twoim stylu!",
    "next": "Dalej",
    "scan_code_in_restaurants_to_see_the_special":
        "Skanuj kody w restauracjach aby zobaczyć specjalne oferty naszych partnerów",
    "feel_like_an_influrencer": "Poczuj się jak influencer",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    enCode: en,
    plCode: en
  };
}

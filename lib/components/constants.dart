import 'package:flutter/material.dart';

class AppConstants {
  static const String watchersCountTitle = 'Количество просмотров: ';
  static const String stargazersCountTitle = 'Количество звезд: ';
  static const String ownerTitle = 'Автор: ';
  static const String repositoryNameTitle = 'Имя проекта: ';
  static const String error = 'Ошибка';
  static const String unknown = 'Неизвестно';
  static const String splashScreenTitle = 'Splash Screen';
  static const String empty = 'Пусто';
  static const String inputRequestTitle = 'Введите свой запрос';
  static const String search = 'Поиск';
  static const String searchPageTitle = 'Страница поиска';
  static const String searchResultPageTitle = 'Результат запроса';
  static const String favouritesPageTitle = 'Избранное';
  static const String clearFavouritesTitle = 'Очистить избранное';
  static const String searchRequestValidateErrorMessage =
      'Запрос должен содержать минимум 3 символа';
  static const String notFoundPage = 'Страница не найдена';

  static const MaterialColor githubBrandColor = MaterialColor(
    _darkBlackPrimaryValue,
    <int, Color>{
      50: Color(0x00000000),
      100: Color(0x05050505),
      200: Color(0x10101010),
      300: Color(0xA0A0A0A0),
      400: Color(0xB0B0B0B0),
      500: Color(_darkBlackPrimaryValue),
      600: Color(0xC0C0C0C0),
      700: Color(0xD0D0D0D0),
      800: Color(0xF0F0F0F0),
      900: Color(0xFFFFFFFF),
    },
  );

  static const Color githubColor = Color.fromARGB(255, 36, 41, 47);

  static const int minLettersInRequest = 3;
  static const int _darkBlackPrimaryValue = 0xA0FFFFfF;
}

import 'dart:ui';

class LanguageState{}
class LanguageInitial extends LanguageState{}
class LanguageChanged extends LanguageState{
  Locale locale;
  LanguageChanged({required this.locale});

}
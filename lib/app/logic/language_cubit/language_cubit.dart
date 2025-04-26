import 'dart:ui';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void changeLanguage(Locale locale) {
    emit(LanguageChanged(locale: locale));
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    final String? locale = json['locale'] as String?;
    if (locale != null) {
      return LanguageChanged(locale: Locale(locale));
    }
    return LanguageInitial();
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    if (state is LanguageChanged) {
      return {'locale': state.locale.languageCode};
    }
    return null;
  }
}

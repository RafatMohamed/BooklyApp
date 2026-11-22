# Bookly | Flutter Book Discovery

A Flutter book-discovery project using the Google Books API, with book lists, search, details and Firebase account flows.

## Features

- Home book lists loaded from Google Books API volume queries.
- Book search and a details screen, with related-book filtering based on categories or title similarity.
- An external book-link action using `url_launcher`.
- Firebase email/password registration, login and password-reset flows.
- A Google sign-in callback on the registration screen.
- Arabic and English translations, light/dark theme switching and local profile/settings storage.
- Book-cover loading with cached network images and loading effects.

## Structure and state management

Feature-based organization with repositories for network/authentication operations and Cubits for UI state. Dio is wrapped by a shared API helper. Hive stores local user/settings data, and a HydratedCubit persists the language choice.

## Main packages

`flutter_bloc`, `dio`, `dartz`, `equatable`, `hive`, `hive_flutter`, `hydrated_bloc`, `easy_localization`, `firebase_auth`, `google_sign_in`, `cached_network_image`, `shimmer`, `image_picker` and `url_launcher`.

## Getting started

Use a Flutter installation whose bundled Dart SDK satisfies `^3.7.0`, as declared in `pubspec.yaml`.

```bash
git clone https://github.com/RafatMohamed/BooklyApp.git
cd BooklyApp
flutter pub get
```

1. Configure your own Firebase project and regenerate Firebase options/platform files. Enable Email/Password authentication; configure Google Sign-In if using that callback.
2. Review `lib/core/network/end_points.dart` for the Google Books queries. An internet connection is needed for book retrieval.
3. For model changes, regenerate Hive adapters with `dart run build_runner build --delete-conflicting-outputs`.

After completing the configuration above:

```bash
flutter run
```

## Current scope and limitations

- The Google sign-in callback currently navigates to a separate test view rather than the normal email-login route. Treat that flow as work in progress.
- The API query names request free/newest books, but the current query parameters should be checked against the API before promising those filters.
- The app opens book links; a built-in full-book reader or download library is not implemented.
- This README describes source-code implementation. Builds, external services and user flows have not been run as part of this documentation review.

## Code guide

- [`lib/features/home/data/repo.dart`](lib/features/home/data/repo.dart)
- [`lib/features/search/data/repo.dart`](lib/features/search/data/repo.dart)
- [`lib/features/search/model/search_cubit/search_cubit.dart`](lib/features/search/model/search_cubit/search_cubit.dart)
- [`lib/features/register/views/register_view.dart`](lib/features/register/views/register_view.dart)
- [`lib/app/logic/language_cubit/language_cubit.dart`](lib/app/logic/language_cubit/language_cubit.dart)
- [`lib/main.dart`](lib/main.dart)

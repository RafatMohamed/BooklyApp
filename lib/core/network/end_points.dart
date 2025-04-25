abstract class EndPoints{
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String fetchNewestBooks = 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science&maxResults=20';
  static const String fetchFutureBooks = 'volumes?Filtering=free-ebooks&q=subject:Programming&maxResults=20';
  static const String searchBooks = 'volumes?q=';

}
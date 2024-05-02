class SearchTimeoutException implements Exception {
  final String message;

  SearchTimeoutException(this.message);

  @override
  String toString() {
    return 'SearchTimeoutException: $message';
  }
}

class GeneralException implements Exception {
  final String message;
  const GeneralException({required this.message});

  @override
  String toString() {
    return message;
  }
}

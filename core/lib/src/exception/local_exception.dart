class LocalException implements Exception {
  final String? title;
  final String? message;

  const LocalException({this.title, this.message});
}

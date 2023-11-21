class ApiException implements Exception {
  final String? title;
  final String? message;

  const ApiException({this.title, this.message});
}

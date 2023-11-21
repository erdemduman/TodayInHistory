import 'package:core/core.dart';

class HistoryEntity extends Equatable {
  final String wikipedia;
  final String date;
  final List<HistoryEntityBody> body;

  const HistoryEntity({
    required this.wikipedia,
    required this.date,
    required this.body,
  });

  @override
  List<Object> get props => [wikipedia, date, body];
}

class HistoryEntityBody extends Equatable {
  final String year;
  final String description;
  final List<HistoryEntityWikipedia> wikipedia;

  const HistoryEntityBody({
    required this.year,
    required this.description,
    required this.wikipedia,
  });

  @override
  List<Object> get props => [year, description, wikipedia];
}

class HistoryEntityWikipedia extends Equatable {
  final String title;
  final String url;

  const HistoryEntityWikipedia({required this.title, required this.url});

  @override
  List<Object> get props => [title, url];
}

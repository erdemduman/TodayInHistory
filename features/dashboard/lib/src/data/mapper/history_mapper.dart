import 'package:dashboard/src/domain/entity/history_entity.dart';

import '../model/history_model.dart';

class HistoryMapper {
  static HistoryEntity toEntity(HistoryModel model) => HistoryEntity(
        wikipedia: model.wikipedia ?? "",
        date: model.date ?? "",
        body: model.body
                ?.map(
                  (b) => HistoryEntityBody(
                    year: b.year ?? "0000",
                    description: b.description ?? "",
                    wikipedia: b.wikipedia
                            ?.map(
                              (w) => HistoryEntityWikipedia(
                                title: w.title ?? "",
                                url: w.url ?? "",
                              ),
                            )
                            .toList() ??
                        <HistoryEntityWikipedia>[],
                  ),
                )
                .toList() ??
            <HistoryEntityBody>[],
      );
}

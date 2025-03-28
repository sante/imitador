import 'package:imitador/core/source/common/hive_base_source.dart';
import 'package:imitador/model/attempt/attempt.dart';

class AttemptLocalSource extends HiveBaseSource<String, Attempt> {
  AttemptLocalSource()
      : super(
          dbParser: (level) => level.toJson(),
          modelParser: (level) => Attempt.fromJson(level),
        );

  Future<List<Attempt>> replaceAttempts(List<Attempt> elements) async {
    await deleteAllElements();
    return putAllElements(
      Map.fromEntries(
        elements.map(
          (e) => MapEntry(e.id!, e),
        ),
      ),
    );
  }
}

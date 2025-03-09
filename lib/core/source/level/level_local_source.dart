import 'package:imitador/core/source/common/hive_base_source.dart';
import 'package:imitador/model/level/level.dart';


class LevelLocalSource extends HiveBaseSource<String, Level> {
  LevelLocalSource()
      : super(
    dbParser: (level) => level.toJson(),
    modelParser: (level) => Level.fromJson(level),
  );

  Future<List<Level>> replaceLevels(List<Level> elements) async {
    await deleteAllElements();
    return putAllElements(
      Map.fromEntries(
        elements.map(
              (e) => MapEntry(e.id, e),
        ),
      ),
    );
  }
}
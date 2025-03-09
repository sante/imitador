import 'package:imitador/core/source/common/hive_base_source.dart';
import 'package:imitador/model/activity/activity.dart';


class ActivityLocalSource extends HiveBaseSource<String, Activity> {
  ActivityLocalSource()
      : super(
    dbParser: (activity) => activity.toJson(),
    modelParser: (activity) => Activity.fromJson(activity),
  );

  Future<List<Activity>> replaceActivities(List<Activity> elements) async {
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
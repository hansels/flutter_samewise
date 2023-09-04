import 'package:flutter_samewise/basics/helpers/base_http_helper.dart';
import 'package:flutter_samewise/models/activites.dart';

class ActivityHelper extends BaseHTTPHelper {
  @override
  String get modelName => "activity";

  @override
  String get route => "activitiy";

  Future<List<Activity>> list() async {
    Map<String, dynamic> result = await get(endpoint: "list");

    List<Activity> listOfData = [];
    if (result["lists"] == null) return listOfData;
    for (Map<String, dynamic> map in result["lists"]) {
      listOfData.add(Activity.fromMap(map)!);
    }
    return listOfData;
  }
}

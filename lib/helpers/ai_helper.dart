import 'package:flutter_samewise/basics/helpers/base_http_helper.dart';

class AIHelper extends BaseHTTPHelper {
  @override
  String get modelName => "model";

  @override
  String get route => "model";

  Future<String> ask(String question) async {
    Map<String, dynamic> result = await post(endpoint: "ask", json: question);

    return result["answer"];
  }
}

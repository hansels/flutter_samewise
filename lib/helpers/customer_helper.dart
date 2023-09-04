import 'package:flutter_samewise/basics/helpers/base_http_helper.dart';
import 'package:flutter_samewise/models/customer.dart';

class CustomerHelper extends BaseHTTPHelper {
  @override
  String get modelName => "customer";

  @override
  String get route => "customer";

  Future<List<Customer>> list() async {
    Map<String, dynamic> result = await get(endpoint: "list");

    List<Customer> listOfData = [];
    if (result["lists"] == null) return listOfData;
    for (Map<String, dynamic> map in result["lists"]) {
      listOfData.add(Customer.fromMap(map)!);
    }
    return listOfData;
  }

  Future<Customer> load(String id) async {
    Map<String, dynamic> result = await get(endpoint: "load/$id");

    return Customer.fromMap(result)!;
  }
}

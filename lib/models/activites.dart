import 'package:flutter_samewise/models/customer.dart';

class Activity {
  final String? id;
  String name;
  String? description;
  String? date;
  Customer? customer;

  Activity({
    this.id,
    this.customer,
    required this.name,
    this.description = "",
    this.date,
  });

  Activity.copy(Activity tenant)
      : this(
          id: tenant.id,
          customer: tenant.customer,
          name: tenant.name,
          description: tenant.description,
          date: tenant.date,
        );

  static Activity? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Activity(
            id: data["id"] ?? "",
            customer: Customer.fromMap(data["customer"]),
            name: data["name"] ?? "",
            description: data["description"] ?? "",
            date: data["date"] ?? "",
          );
  }

  static List<String>? toListString(List<dynamic>? data) {
    return data?.map((e) => e as String).toList();
  }
}

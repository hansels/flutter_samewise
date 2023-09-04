import 'package:flutter_samewise/models/customer.dart';

class Activity {
  final String? id;
  String name;
  String? description;
  String? date;
  String? message;
  String? benefits;
  Customer? customer;

  Activity({
    this.id,
    this.customer,
    required this.name,
    this.description = "",
    this.date,
    this.message,
    this.benefits,
  });

  Activity.copy(Activity tenant)
      : this(
          id: tenant.id,
          customer: tenant.customer,
          name: tenant.name,
          description: tenant.description,
          date: tenant.date,
          message: tenant.message,
          benefits: tenant.benefits,
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
            message: data["message"] ?? "",
            benefits: data["benefits"] ?? "",
          );
  }

  static List<String>? toListString(List<dynamic>? data) {
    return data?.map((e) => e as String).toList();
  }
}

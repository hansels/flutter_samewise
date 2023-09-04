class Customer {
  final String? id;
  String name;
  String? job;
  DateTime? birthday;
  int? level;

  Customer({
    this.id,
    this.job,
    this.birthday,
    required this.name,
    this.level = 1,
  });

  Customer.copy(Customer customer)
      : this(
          id: customer.id,
          job: customer.job,
          birthday: customer.birthday,
          name: customer.name,
          level: customer.level,
        );

  static Customer? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Customer(
            id: data["id"] ?? "",
            job: data["job"] ?? "",
            birthday: data["birthday"] ?? "",
            name: data["name"] ?? "",
            level: data["level"] ?? 1,
          );
  }

  static List<String>? toListString(List<dynamic>? data) {
    return data?.map((e) => e as String).toList();
  }
}

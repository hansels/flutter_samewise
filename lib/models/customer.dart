class Customer {
  final String? id;
  String name;
  String? job;
  String? education;
  String? email;
  String? telephone;
  String? birthday;
  List<String>? notes;
  int? level;

  Customer({
    this.id,
    this.job,
    this.email,
    this.telephone,
    this.education,
    this.birthday,
    this.notes,
    required this.name,
    this.level = 1,
  });

  Customer.copy(Customer customer)
      : this(
          id: customer.id,
          job: customer.job,
          education: customer.education,
          email: customer.email,
          telephone: customer.telephone,
          birthday: customer.birthday,
          notes: customer.notes,
          name: customer.name,
          level: customer.level,
        );

  static Customer? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Customer(
            id: data["id"] ?? "",
            job: data["job"] ?? "",
            education: data["education"] ?? "",
            email: data["email"] ?? "",
            telephone: data["telephone"] ?? "",
            notes: toListString(data["notes"]) ?? [],
            birthday: data["birthDate"] ?? "",
            name: data["name"] ?? "",
            level: data["level"] ?? 1,
          );
  }

  static List<String>? toListString(List<dynamic>? data) {
    return data?.map((e) => e as String).toList();
  }
}

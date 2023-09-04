import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/models/customer.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class UserListPage extends CoreStatefulWidget {
  const UserListPage({super.key});

  @override
  CoreStatefulWidgetState<UserListPage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<UserListPage> {
  List<Customer> customers = [
    Customer(
      name: "Budi Suwanto",
      id: "1",
      job: "Chief Executive Officer",
      birthday: DateTime(1985, 8, 16),
      level: 3,
    ),
    Customer(
      name: "Joko Subianto",
      id: "2",
      job: "Chief Technology Officer",
      birthday: DateTime(1981, 8, 16),
      level: 2,
    ),
    Customer(
      name: "Susi Suwan",
      id: "3",
      job: "Head of Human Resource",
      birthday: DateTime(1988, 6, 20),
      level: 2,
    ),
    Customer(
      name: "Rudi Sunarto",
      id: "4",
      job: "Lead Developer",
      birthday: DateTime(1992, 8, 6),
      level: 1,
    ),
    Customer(
      name: "Budi Santo",
      id: "5",
      job: "Team Lead",
      birthday: DateTime(1998, 1, 24),
      level: 1,
    ),
    Customer(
      name: "Rita Purba",
      id: "6",
      job: "Entrepreneur",
      birthday: DateTime(1992, 2, 16),
      level: 1,
    ),
    Customer(
      name: "Chief",
      id: "7",
      job: "Chief Executive Officer",
      birthday: DateTime(1985, 8, 16),
      level: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        "assets/sam.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 120.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            color: Color.fromARGB(255, 116, 63, 63),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: CustomText(
                              "Berikut merupakan daftar customermu.",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomText(
                  textAlign: TextAlign.left,
                  "Daftar Pengguna",
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: customers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    var length =
                        customers[i].name.length % Configs.colorAvatars.length;
                    var level = customers[i].level == 3
                        ? const Color.fromARGB(255, 255, 215, 0)
                        : customers[i].level == 2
                            ? const Color.fromARGB(255, 192, 192, 192)
                            : Colors.transparent;
                    return InkWell(
                      onTap: () async {
                        Routes.push(context, PageName.UserDetail, arguments: {
                          "customer": customers[i],
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(99999),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/placholder_person.jpg",
                                      color: Configs.colorAvatars[length],
                                      colorBlendMode: BlendMode.hue,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 6,
                                      child: Icon(
                                        Icons.verified,
                                        color: level,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 5),
                                    CustomText(
                                      "${customers[i].name}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(height: 5),
                                    CustomText(
                                      "${customers[i].job}",
                                      fontSize: 12,
                                    ),
                                    Container(height: 5),
                                    CustomText(
                                      "${customers[i].birthday!.day}-${customers[i].birthday!.month}-${customers[i].birthday!.year}",
                                      fontSize: 12,
                                    ),
                                    Container(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

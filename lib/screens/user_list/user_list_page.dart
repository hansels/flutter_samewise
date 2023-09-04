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
      birthday: " 16 - Agustus - 1985 ",
      level: 3,
    ),
    Customer(
      name: "Joko Subianto",
      id: "2",
      job: "Chief Technology Officer",
      birthday: "16 - Agustus - 1981",
      level: 2,
    ),
    Customer(
      name: "Susi Suwan",
      id: "3",
      job: "Head of Human Resource",
      birthday: "20 - Juli - 1988",
      level: 2,
    ),
    Customer(
      name: "Rudi Sunarto",
      id: "4",
      job: "Lead Developer",
      birthday: "6 - Agustus - 1992",
      level: 1,
    ),
    Customer(
      name: "Budi Santo",
      id: "5",
      job: "Team Lead",
      birthday: "24 - Januari - 1998",
      level: 1,
    ),
    Customer(
      name: "Rita Purba",
      id: "6",
      job: "Entrepreneur",
      birthday: "16 - Februari - 1996",
      level: 1,
    ),
    Customer(
      name: "Chief",
      id: "7",
      job: "Chief Executive Officer",
      birthday: " 16 - Agustus - 1985 ",
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: 110,
                        child: Image.asset(
                          "assets/sam.png",
                          fit: BoxFit.cover,
                        ),
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(99999),
                                      ),
                                      child: Image.asset(
                                        "assets/${customers[i].id}.png",
                                      ),
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
                                      "${customers[i].birthday}",
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

import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class UserListPage extends CoreStatefulWidget {
  const UserListPage({super.key});

  @override
  CoreStatefulWidgetState<UserListPage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<UserListPage> {
  List<Map<String, dynamic>> list = [
    {
      "person": "Budi Suwanto",
      "job": "Chief Executive Officer",
      "birthday": "16 Agustus 1985",
      "priority": 3
    },
    {
      "person": "Joko Subianto",
      "job": "Chief Technology Officer",
      "birthday": "16 Agustus 1981",
      "priority": 2
    },
    {
      "person": "Hana Bang",
      "job": "Head of Human Resource",
      "birthday": "20 Juni 1988",
      "priority": 2
    },
    {
      "person": "Susi Sunarto",
      "job": "Lead Developer",
      "birthday": "05 Juni 1992",
      "priority": 1
    },
    {
      "person": "Budi Santo",
      "job": "Team Lead",
      "birthday": "20 Januari 1998",
      "priority": 1
    },
    {
      "person": "Rita Purba",
      "job": "Entrepreneur",
      "birthday": "16 Juli 1999",
      "priority": 1
    },
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
                  itemCount: list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    var length =
                        list[i]["person"].length % Configs.colorAvatars.length;
                    var level = list[i]['priority'] == 3
                        ? const Color.fromARGB(255, 255, 215, 0)
                        : list[i]["priority"] == 2
                            ? const Color.fromARGB(255, 192, 192, 192)
                            : Colors.transparent;
                    return InkWell(
                      onTap: () async {
                        Routes.push(
                          context,
                          PageName.UserDetail,
                        );
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
                                      "${list[i]['person']}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(height: 5),
                                    CustomText(
                                      "${list[i]['job']}",
                                      fontSize: 12,
                                    ),
                                    Container(height: 5),
                                    CustomText(
                                      "${list[i]['birthday']}",
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

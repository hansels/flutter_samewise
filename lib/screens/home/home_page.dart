import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/models/activites.dart';
import 'package:flutter_samewise/models/customer.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class HomePage extends CoreStatefulWidget {
  const HomePage({super.key});

  @override
  CoreStatefulWidgetState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<HomePage> {
  List<Activity> activities = [
    Activity(
      name: "Ucapan",
      customer: Customer(
        name: "Budi Suwanto",
        id: "1",
        level: 3,
      ),
      date: DateTime(2023, 8, 15),
      description: "Ulang Tahun",
      id: "1",
    ),
    Activity(
      name: "Ucapan",
      customer: Customer(
        name: "Joko Subianto",
        id: "2",
        level: 2,
      ),
      date: DateTime(2023, 8, 16),
      description: "Selamat Kelahiran Anak",
      id: "2",
    ),
    Activity(
      name: "Kirim",
      customer: Customer(
        name: "Susi Suwan",
        id: "3",
        level: 2,
      ),
      date: DateTime(2023, 8, 16),
      description: "Parsel atas Kesuksesan membuka toko baru",
      id: "3",
    ),
    Activity(
      name: "Ucapan ",
      customer: Customer(
        name: "Rudi Sunarto",
        id: "4",
        level: 1,
      ),
      date: DateTime(2023, 8, 16),
      description: "Semoga Lekas Sembuh Sakit DBD",
      id: "4",
    ),
    Activity(
      name: "Ucapan",
      customer: Customer(
        name: "Budi Santo",
        id: "5",
        level: 1,
      ),
      date: DateTime(2023, 8, 16),
      description: "Kelulusan Anak",
      id: "5",
    ),
    Activity(
      name: "Kirim",
      customer: Customer(
        name: "Rita Purba",
        id: "6",
        level: 1,
      ),
      date: DateTime(2023, 8, 16),
      description: "Parsel Benefit Nasabah",
      id: "6",
    ),
    Activity(
      name: "Ucapan",
      customer: Customer(
        name: "Budi Suwanto",
        id: "7",
        level: 3,
      ),
      date: DateTime(2023, 8, 17),
      description: "Lekas Sembuh",
      id: "7",
    ),
    Activity(
      name: "Ucapan",
      customer: Customer(
        name: "Joko Subianto",
        id: "8",
        level: 2,
      ),
      date: DateTime(2023, 8, 18),
      description: "Anak Melahirkan",
      id: "8",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Routes.push(context, PageName.UserList),
                  child: SizedBox(
                    height: 150,
                    child: Image.asset(
                      "assets/SameWise_16_9.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CustomText(
                  textAlign: TextAlign.left,
                  "Welcome to SameWISE",
                  fontSize: 24,
                ),
                Container(
                  height: 8,
                ),
                const CustomText(
                  "Today's List of Activities",
                  fontSize: 16,
                ),
                Container(
                  height: 12,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: activities.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    var length = (activities[i].customer?.name.length ?? 0) %
                        Configs.colorAvatars.length;
                    var level = activities[i].customer?.level == 3
                        ? const Color.fromARGB(255, 255, 215, 0)
                        : activities[i].customer?.level == 2
                            ? const Color.fromARGB(255, 192, 192, 192)
                            : Colors.transparent;
                    return InkWell(
                      onTap: () async {
                        Routes.push(
                          context,
                          PageName.ActivityDetail,
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
                                      "${activities[i].name} ${activities[i].description} ${activities[i].customer?.name}",
                                      fontSize: 15,
                                    ),
                                    Container(height: 10),
                                    CustomText(
                                      "${activities[i].date!.day}-${activities[i].date!.month}-${activities[i].date!.year}",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

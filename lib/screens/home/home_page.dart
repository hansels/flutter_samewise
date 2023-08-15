import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class HomePage extends CoreStatefulWidget {
  const HomePage({super.key});

  @override
  CoreStatefulWidgetState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<HomePage> {
  List<Map<String, dynamic>> list = [
    {
      "person": "Budi Suwanto",
      "event": "Ucapan: Ulang Tahun",
      "due": "16 Agustus 2023",
      "priority": 3
    },
    {
      "person": "Joko Subianto",
      "event": "Ucapan: Ulang Tahun",
      "due": "16 Agustus 2023",
      "priority": 2
    },
    {
      "person": "Hana Bang",
      "event": "Kirim: Parsel Selamat Sukses",
      "due": "16 Agustus 2023",
      "priority": 2
    },
    {
      "person": "Susi Sunarto",
      "event": "Ucapan: Semoga Lekas Sembuh",
      "due": "16 Agustus 2023",
      "priority": 1
    },
    {
      "person": "Budi Santo",
      "event": "Tanya: Kelahiran Bayi",
      "due": "16 Agustus 2023",
      "priority": 1
    },
    {
      "person": "Rita Purba",
      "event": "Kirim: Benefit Nasabah",
      "due": "16 Agustus 2023",
      "priority": 1
    },
    {
      "person": "Budi Suwanto",
      "event": "Ucapan: Lekas Sembuh",
      "due": "17 Agustus 2023",
      "priority": 3
    },
    {
      "person": "Joko Subianto",
      "event": "Ucapan: Anak Melahirkan",
      "due": "18 Agustus 2023",
      "priority": 2
    },
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
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/SameWise_16_9.png",
                    fit: BoxFit.cover,
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
                  itemCount: list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    var length =
                        list[i]["person"].length % Configs.colorAvatars.length;
                    var level = list[i]['priority'] == 2
                        ? const Color.fromARGB(255, 255, 215, 0)
                        : list[i]["priority"] == 1
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
                                      "${list[i]['event']} ${list[i]['person']}",
                                      fontSize: 15,
                                    ),
                                    Container(height: 10),
                                    const CustomText(
                                      "16 Agustus 2023",
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

import 'package:flutter/material.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/functions/token_version.dart';
import 'package:flutter_samewise/models/activites.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity?> activities = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TokenVersion.getActivities(),
        builder: (context, snapshot) {
          activities = snapshot.data ?? [];
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomText(
                          textAlign: TextAlign.left,
                          "Welcome to SameWISE",
                          fontSize: 24,
                        ),
                      ),
                      Container(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomText(
                          "Menurut Sam, ini adalah prioritas aktivitasmu minggu ini.",
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 12,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: activities.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          var level = activities[i]?.customer?.level == 3
                              ? const Color.fromARGB(255, 255, 215, 0)
                              : activities[i]?.customer?.level == 2
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
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(99999),
                                            ),
                                            child: Image.asset(
                                              "assets/${activities[i]?.customer!.id}.png",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(height: 5),
                                          CustomText(
                                            "${activities[i]?.name} ${activities[i]?.description} ${activities[i]?.customer?.name}",
                                            fontSize: 15,
                                          ),
                                          Container(height: 10),
                                          CustomText(
                                            "${activities[i]?.date}",
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
        });
  }
}

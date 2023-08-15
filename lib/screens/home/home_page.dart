import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class HomePage extends CoreStatefulWidget {
  const HomePage({super.key});

  @override
  CoreStatefulWidgetState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<HomePage> {
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 5),
                            const CustomText(
                              "Ucapan Ulang Tahun Joko Subianto",
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
                    );
                  },
                  itemCount: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/models/activites.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class ActivityDetailPage extends CoreStatefulWidget {
  final Activity activity;
  const ActivityDetailPage({required this.activity, super.key});

  @override
  CoreStatefulWidgetState<ActivityDetailPage> createState() =>
      _ActivityDetailPageState();
}

class _ActivityDetailPageState
    extends CoreStatefulWidgetState<ActivityDetailPage> {
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
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CustomText(
                              "Menurut Sam, berikut merupakan beberapa poin untuk ${widget.activity.name} ${widget.activity.description} ${widget.activity.customer!.name}.",
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
                  "Saran Pesan",
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.white70,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 8,
                        ),
                        CustomText(
                          widget.activity.message ?? '',
                          fontSize: 14,
                        ),
                        Container(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  textAlign: TextAlign.left,
                  "Saran Benefit / Hadiah",
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.white70,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 8,
                        ),
                        CustomText(
                          widget.activity.benefits ?? "",
                          fontSize: 14,
                        ),
                        Container(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class ActivityDetailPage extends CoreStatefulWidget {
  const ActivityDetailPage({super.key});

  @override
  CoreStatefulWidgetState<ActivityDetailPage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<ActivityDetailPage> {
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
                              "Menurut Sam, berikut merupakan beberapa poin untuk Ulang Tahun Budi Suwanto.",
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
                  height: 10,
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
                        const CustomText(
                          "Dear Budi,\n\nWishing you a fantastic 38th birthday filled with joy, laughter, and unforgettable moments! As you celebrate another year of life, may it bring you new adventures, cherished memories, and continued success.\n\nYour journey so far has been remarkable, and we are proud to have you as a valuable member of our team. Your dedication, hard work, and positive energy inspire us all. May this new year ahead be filled with exciting opportunities and accomplishments that exceed even your wildest dreams.\n\nTake some time today to pamper yourself, indulge in your favorite treats, and bask in the love and warmth of your friends and family. You deserve all the happiness and success that life has to offer.\n\nHappy birthday once again, Budi! Here's to an amazing year ahead and many more to come.\n\nWarmest wishes",
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
                  height: 20,
                ),
                const CustomText(
                  textAlign: TextAlign.left,
                  "Saran Benefit / Hadiah",
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 10,
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
                        const CustomText(
                          "Berikut Beberapa Benefit yang mungkin cocok untuk Budi:\n\n1. Gift Card : Gift Card untuk Budi merayakan pesta ulang tahunnya bersama keluarga mungkin dapat menjadi pertimbangan untuk benefit yang layak\n\n2. Personalized Gifts : Dengan melihat sejarah Budi, karena Budi memiliki hobi bermain tennis, hadiah berupa raket tennis, ataupun seperangkat alat tenis dapat diberikan kepada Budi.",
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

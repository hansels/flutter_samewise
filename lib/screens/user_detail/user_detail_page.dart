import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class UserDetailPage extends CoreStatefulWidget {
  const UserDetailPage({super.key});

  @override
  CoreStatefulWidgetState<UserDetailPage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<UserDetailPage> {
  Map<String, dynamic> data = {
    "person": "Budi Suwanto",
    "job": "Chief Executive Officer",
    "birthday": "16 Agustus 1985",
    "priority": 3
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    var length = data["person"].length % Configs.colorAvatars.length;
    var level = data['priority'] == 3
        ? const Color.fromARGB(255, 255, 215, 0)
        : data["priority"] == 2
            ? const Color.fromARGB(255, 192, 192, 192)
            : Colors.transparent;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 175,
                    width: 175,
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
                          right: 30,
                          child: Icon(
                            Icons.verified,
                            color: level,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomText(
                    data["person"],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          ..._buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomText(
                  "Data Pribadi",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                Card(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.email, size: 24),
                            SizedBox(width: 10),
                            CustomText(
                              "budi@suwanto.com",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Icon(Icons.phone, size: 24),
                            SizedBox(width: 10),
                            CustomText(
                              "08123456789",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.cake, size: 24),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                data["birthday"],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Icon(Icons.home, size: 24),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                "Jl. Jakarta Pusat, No. 20",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ..._buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: const CustomText(
                        "Catatan Kolega",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.add))
                  ],
                ),
                Card(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomText(
                      "1. Beliau memiliki 3 orang anak, sehingga jika diberikan bonus yang dapat membantu mengurus anaknya akan sangat membantu bagi beliau.\n\n2. Beliau suka bermain golf\n\n3. Sebagai CEO, beliau tidak memiliki banyak waktu, maka berikan penawaran yang membantu beliau mempercepat kesulitan kesulitan dalam transaksi.",
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> _buildDivider() {
    return [
      const SizedBox(height: 5),
      Divider(
        thickness: 7.5,
        height: 20,
        color: Colors.grey[300],
      ),
      const SizedBox(height: 5),
    ];
  }
}

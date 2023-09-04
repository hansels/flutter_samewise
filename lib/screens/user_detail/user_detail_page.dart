import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/models/customer.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';

class UserDetailPage extends CoreStatefulWidget {
  UserDetailPage({super.key, required this.customer});

  Customer customer;

  @override
  CoreStatefulWidgetState<UserDetailPage> createState() =>
      _UserDetailPageState();
}

class _UserDetailPageState extends CoreStatefulWidgetState<UserDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    var level = widget.customer.level == 3
        ? const Color.fromARGB(255, 255, 215, 0)
        : widget.customer.level == 2
            ? const Color.fromARGB(255, 192, 192, 192)
            : Colors.transparent;

    var kontent = widget.customer.notes?.join("\n\n");

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
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(99999),
                          ),
                          child: Image.asset(
                            "assets/${widget.customer.id}.png",
                          ),
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
                    widget.customer.name,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                  fontWeight: FontWeight.w700,
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
                        Row(
                          children: [
                            const Icon(Icons.email, size: 24),
                            const SizedBox(width: 10),
                            CustomText(
                              widget.customer.email ?? "",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 24),
                            const SizedBox(width: 10),
                            CustomText(
                              widget.customer.telephone ?? "",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.work, size: 24),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                "${widget.customer.job}",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.school, size: 24),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                "${widget.customer.education}",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
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
                                "${widget.customer.birthday}",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: CustomText(
                        "Catatan Kolega",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(onPressed: () => {}, icon: const Icon(Icons.add))
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomText(
                        kontent ?? "",
                        //"1. Beliau memiliki 3 orang anak, benefit untuk anaknya akan sangat membantu bagi beliau.\n\n2. Beliau suka bermain golf.\n\n3. Beliau Selalu menyukai Titleist.\n\n4. CEO tidak suka dibuang waktu, jangan bertele-tele.\n\n5. Sebagai CEO, beliau tidak memiliki banyak waktu, penawaran yang membantu mempercepat proses transaksi.",
                        fontSize: 14,
                      ),
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

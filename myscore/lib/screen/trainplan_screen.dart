import 'package:flutter/material.dart';

class TrainPlanScreen extends StatelessWidget {
  const TrainPlanScreen({super.key});

  final List<Map<String, String>> trainPlans = const [
    {
      "logo": "assets/mrt_purple.png",
      "title": "โครงการรถไฟฟ้าสายสีม่วง ช่วงที่ 2",
      "subtitle": "เตาปูน - ราษฎร์บูรณะ",
      "open_date": "เปิดบริการ: ธ.ค. 2570"
    },
    {
      "logo": "assets/mrt_orange.png",
      "title": "โครงการรถไฟฟ้าสายสีส้ม ช่วงที่ 1",
      "subtitle": "ศูนย์วัฒนธรรมแห่งประเทศไทย - มีนบุรี",
      "open_date": "เปิดบริการ: ธ.ค. 2571"
    },
    {
      "logo": "assets/mrt_orange.png",
      "title": "โครงการรถไฟฟ้าสายสีส้ม ช่วงที่ 2",
      "subtitle": "บางขุนนนท์ - ศูนย์วัฒนธรรมแห่งประเทศไทย",
      "open_date": "เปิดบริการ: ม.ค. 2571"
    },
    {
      "logo": "assets/airport_rail_link.jpg",
      "title": "Airport Rail Link",
      "subtitle": "ดอนเมือง - พญาไท - สุวรรณภูมิ",
      "open_date": "เปิดบริการ: ยังไม่ระบุ"
    },
    {
      "logo": "assets/mrt_pink.png",
      "title": "โครงการรถไฟฟ้าสายสีชมพู ส่วนต่อขยาย",
      "subtitle": "ช่วงศรีรัช - เมืองทองธานี",
      "open_date": "เปิดบริการ: ม.ค. 2568"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'แผนงานรถไฟฟ้า',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trainPlans.length,
        itemBuilder: (context, index) {
          final train = trainPlans[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      train["logo"]!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          train["title"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          train["subtitle"]!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          train["open_date"]!,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutBkkRailScreen extends StatelessWidget {
  const AboutBkkRailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('เกี่ยวกับ BKK Rail'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          "แอปพลิเคชันนี้จัดทำขึ้นโดย กรมการขนส่งทางราง,\n"
          "สำนักงานนโยบายและแผนการขนส่งและจราจร (สนข.)\n"
          "กระทรวงคมนาคม ร่วมกับ คณะวิศวกรรมศาสตร์ \n"
          "มหาวิทยาลัยมหิดล \n\n"
          "ขอขอบคุณ การรถไฟฟ้าขนส่งมวลชนแห่งประเทศไทย,\n"
          "การรถไฟแห่งประเทศไทย, บริษัท รถไฟฟ้า ร.ฟ.ท. จำกัด,\n"
          "บริษัท ระบบขนส่งมวลชนกรุงเทพ จำกัด (มหาชน),\n"
          "บริษัท ทางด่วนและรถไฟฟ้ากรุงเทพ จำกัด (มหาชน),\n"
          "บริษัท กรุงเทพธนาคม จำกัด, สำนักการจราจรและขนส่ง \nกรุงเทพมหานคร",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17.0),
        ),
      ),
    );
  }
}

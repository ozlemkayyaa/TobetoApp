import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';

class CardTabWidget extends StatelessWidget {
  const CardTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 20,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                istnabulImage,
                width: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                freeEducation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(isImage, width: 250),
            const TabBar(
              isScrollable: true, // Kaydırılabilir
              // başlangıç kısmına geçmesini sağlıyor
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: 'Başvurularım'),
                Tab(text: 'Eğitimlerim'),
                Tab(text: 'Duyuru ve Haberlerim'),
                Tab(text: 'Anketlerim'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

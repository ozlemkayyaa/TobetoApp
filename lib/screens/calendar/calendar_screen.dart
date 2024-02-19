import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: 18),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 1,

        //initialDisplayDate: DateTime(2024, 01, 01, 08, 30),
        //initialSelectedDate: DateTime(2024, 15, 01, 08, 30),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 13, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 3));

  meetings.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "Mobil Uygulama Geliştirme",
      color: Colors.blue,
      recurrenceRule: "FREQ=WEEKLY;BYDAY=TU,TH;WKST=SU;UNTIL=20240131T000000",
      //isAllDay: true, // Bunu yapınca en üste çıkıyor, bunu yapmayıp belli bir saat aralığı da verebilirisin

      /*
      Böylece her Salı ve perşembeye saat 13.00-16.00 arasına Mobil derslerini yerleştirmiş oldum.
      FREQ=WEEKLY: Haftalık tekrar.
      BYDAY=TU,TH: Sadece Salı ve Perşembe günleri.
      WKST=SU: Haftanın ilk günü Pazar.
      UNTIL=20240131T000000: 2024 yılının Ocak ayının sonuna kadar devam et.
       */
    ),
  );
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

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

  // Mobil Uygulama Geliştirme
  final DateTime mobilStartTime =
      DateTime(today.year, today.month, today.day, 13, 0, 0);
  final DateTime mobilEndTime = mobilStartTime.add(const Duration(hours: 3));
  meetings.add(
    Appointment(
      startTime: mobilStartTime,
      endTime: mobilEndTime,
      subject: "Mobil Uygulama Geliştirme",
      color: Colors.blue,
      recurrenceRule: "FREQ=WEEKLY;BYDAY=TU,TH;WKST=SU;UNTIL=20240930T000000",
    ),
  );

  // Java
  final DateTime javaStartTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime javaEndTime = javaStartTime.add(const Duration(hours: 3));
  meetings.add(
    Appointment(
      startTime: javaStartTime,
      endTime: javaEndTime,
      subject: "Java",
      color: Colors.green,
      recurrenceRule:
          "FREQ=WEEKLY;BYDAY=MO,WE,FR;WKST=SU;UNTIL=20240930T000000",
    ),
  );

  // İş Analisti
  final DateTime isAnalistiStartTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime isAnalistiEndTime =
      isAnalistiStartTime.add(const Duration(hours: 3));
  meetings.add(
    Appointment(
      startTime: isAnalistiStartTime,
      endTime: isAnalistiEndTime,
      subject: "İş Analisti",
      color: Colors.orange,
      recurrenceRule: "FREQ=WEEKLY;BYDAY=TU,TH;WKST=SU;UNTIL=20240930T000000",
    ),
  );

  // .Net
  final DateTime dotNetStartTime =
      DateTime(today.year, today.month, today.day, 13, 0, 0);
  final DateTime dotNetEndTime = dotNetStartTime.add(const Duration(hours: 3));
  meetings.add(
    Appointment(
      startTime: dotNetStartTime,
      endTime: dotNetEndTime,
      subject: ".Net",
      color: Colors.purple,
      recurrenceRule:
          "FREQ=WEEKLY;BYDAY=MO,WE,FR;WKST=SU;UNTIL=20240930T000000",
    ),
  );

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

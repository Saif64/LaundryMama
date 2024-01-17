// ignore_for_file: unused_field

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/head4.dart';

class TimeSlotPage extends StatefulWidget {
  const TimeSlotPage({super.key});

  @override
  State<TimeSlotPage> createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
  Time _time = Time.fromTimeOfDay(TimeOfDay.now(), 1);
  bool iosStyle = true;
  DateTime _selectedDate = DateTime.now();

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
    // Navigator.pushReplacementNamed(context, CART_PAGE, arguments: {
    //   'time': _time.format(context),
    //   'date': DateFormat('EEE d MMM, y').format(_selectedDate)
    // });
    context.go(CART_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   toolbarHeight: height * 0.05,
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(height * 0.05),
                const Head4(text: 'Choose when You\'d like to call the rider')
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 325))
                    .moveY(delay: const Duration(milliseconds: 30)),
                Gap(height * 0.05),
                SizedBox(
                  height: height * 0.12,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.green,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 325))
                    .moveY(delay: const Duration(milliseconds: 30)),
                Gap(height * 0.05),
                showPicker(
                  context: context,
                  borderRadius: 50,
                  hourLabel: ':',
                  minuteLabel: "",
                  accentColor: Colors.green,
                  okText: "OKAY",
                  isInlinePicker: true,
                  elevation: 0,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: TimePickerInterval.FIFTEEN,
                  iosStylePicker: iosStyle,
                  showCancelButton: false,
                  // minHour: 9,
                  // maxHour: 20,
                  is24HrFormat: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

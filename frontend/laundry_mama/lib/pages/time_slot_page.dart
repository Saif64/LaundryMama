// ignore_for_file: unused_field

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/head4.dart';

class TimeSlotPage extends StatefulWidget {
  const TimeSlotPage({super.key});

  @override
  State<TimeSlotPage> createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
  Time _time = Time.fromTimeOfDay(TimeOfDay.now(), 1);
  bool iosStyle = false;
  DateTime _selectedDate = DateTime.now();

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
    Navigator.pushReplacementNamed(context, CART_PAGE, arguments: {
      'time': _time.format(context),
      'date': DateFormat('EEE d MMM, y').format(_selectedDate)
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.05,
        title: const Head4(text: 'Date & Time'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.055),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Head4(text: 'Choose when You\'d like to call the rider'),
                Gap(height * 0.05),
                SizedBox(
                  height: height * 0.1,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
                Gap(height * 0.03),
                showPicker(
                  isInlinePicker: true,
                  elevation: 1,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: TimePickerInterval.FIVE,
                  iosStylePicker: iosStyle,
                  minHour: 9,
                  maxHour: 21,
                  is24HrFormat: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

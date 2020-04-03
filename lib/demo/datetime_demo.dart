import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 引入使用日期插件
import 'dart:async'; // 使用异步需要引入

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 40);

  Future<void> _selectDate () async {
    final DateTime date = await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2023)
    );

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectTime () async {
    final TimeOfDay time = await showTimePicker(context: context, initialTime: selectedTime);
    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateTimeDemo'),elevation: 0.0,),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _selectDate,
              child: Row(
                children: <Widget>[
                  Text(DateFormat.yMMMd().format(selectedDate)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            InkWell(
              onTap: _selectTime,
              child: Row(
                children: <Widget>[
                  Text(selectedTime.format(context)),
                  Icon(Icons.arrow_drop_down)
                ]
              )
            )
          ]
        )
      )
    );
  }
}
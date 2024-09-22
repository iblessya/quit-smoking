import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'insert_smoking_info_page3.dart';

class InsertSmokingInfoPage2 extends StatefulWidget {
  final DateTime selectedStartSmokingDate;

  const InsertSmokingInfoPage2({required this.selectedStartSmokingDate, super.key});

  @override
  State<InsertSmokingInfoPage2> createState() => _InsertSmokingInfoPage2State();
}

class _InsertSmokingInfoPage2State extends State<InsertSmokingInfoPage2> {
  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 1));
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('흡연 정보 입력하기'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0).copyWith(top: 20.0),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '금연을 언제부터 시작하셨나요?\n아니면 금연을 언제부터 시작하시겠나요?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          height: 300,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime date) {
                              setState(() {
                                selectedDate = date;
                                formattedDate =
                                '${selectedDate!.year}년 ${selectedDate!.month}월 ${selectedDate!.day}일';
                              });
                            },
                          ),
                        ),
                      );
                    },
                    barrierDismissible: true,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  height: 60,
                  width: 200,
                  child: Center(child: Text(formattedDate)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => InsertSmokingInfoPage3(
                            selectedStartSmokingDate: widget.selectedStartSmokingDate,
                            selectedStartQuitSomkingDate: selectedDate,
                          ),
                        ));
                      },
                      child: Text('다음으로...'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


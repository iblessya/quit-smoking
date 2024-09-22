import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'insert_smoking_info_page2.dart';

class InsertSmokingInfoPage1 extends StatefulWidget {
  const InsertSmokingInfoPage1({super.key});

  @override
  State<InsertSmokingInfoPage1> createState() => _InsertSmokingInfoPage1State();
}

class _InsertSmokingInfoPage1State extends State<InsertSmokingInfoPage1> {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  late String formattedDate;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = '${yesterday.year}년 ${yesterday.month}월 ${yesterday.day}일';
    selectedDate = yesterday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('흡연 정보 입력하기'),
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
                '흡연을 시작한 시기가 언제인가요?',
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
                            maximumYear: DateTime.now().year,
                            maximumDate: DateTime.now(),
                            initialDateTime: yesterday,
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => InsertSmokingInfoPage2(selectedStartSmokingDate: selectedDate!,),)
                        );
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

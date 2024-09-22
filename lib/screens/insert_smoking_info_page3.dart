import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'insert_smoking_info_page4.dart';

class InsertSmokingInfoPage3 extends StatefulWidget {
  final DateTime selectedStartSmokingDate;
  final DateTime selectedStartQuitSomkingDate;

  const InsertSmokingInfoPage3({
    required this.selectedStartSmokingDate,
    required this.selectedStartQuitSomkingDate,
    super.key,
  });

  @override
  State<InsertSmokingInfoPage3> createState() => _InsertSmokingInfoPage3State();
}

class _InsertSmokingInfoPage3State extends State<InsertSmokingInfoPage3> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int countperDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('흡연 정보 입력하기'),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0).copyWith(top: 20.0),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '하루에 담배 몇 개비를 피우시나요?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    maxLines: 1,
                    expands: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      suffixText: '개피',
                    ),
                    onSaved: (String? val) {
                      countperDay = int.parse(val!);
                    },
                    validator: countValidator,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => InsertSmokingInfoPage4(
                                selectedStartSmokingDate: widget.selectedStartSmokingDate,
                                selectedStartQuitSomkingDate: widget.selectedStartQuitSomkingDate,
                                countperDay: countperDay,
                              ),
                            ));
                          }
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
      ),
    );
  }

  String? countValidator(String? val) {
    if(val == null) {
      return '값을 입력해주세요.';
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요.';
    }

    if(number <= 0) {
      return '1개 이상의 값을 입력해주세요.';
    }
  }
}

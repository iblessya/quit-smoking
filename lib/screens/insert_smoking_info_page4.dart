import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'insert_smoking_info_page5.dart';

class InsertSmokingInfoPage4 extends StatefulWidget {
  final DateTime selectedStartSmokingDate;
  final DateTime selectedStartQuitSomkingDate;
  final int countperDay;

  const InsertSmokingInfoPage4({
    required this.selectedStartSmokingDate,
    required this.selectedStartQuitSomkingDate,
    required this.countperDay,
    super.key,
  });

  @override
  State<InsertSmokingInfoPage4> createState() => _InsertSmokingInfoPage4State();
}

class _InsertSmokingInfoPage4State extends State<InsertSmokingInfoPage4> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int price = 0;

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
                  '담배 한갑의 가격이 얼마인가요?',
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
                      suffixText: '원',
                    ),
                    onSaved: (String? val) {
                      price = int.parse(val!);
                    },
                    validator: priceValidator,
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
                              builder: (_) => InsertSmokingInfoPage5(
                                selectedStartSmokingDate: widget.selectedStartSmokingDate,
                                selectedStartQuitSomkingDate: widget.selectedStartQuitSomkingDate,
                                countperDay: widget.countperDay,
                                price: price,
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

  String? priceValidator(String? val) {
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quit_smoking/screens/root_screen.dart';
import 'package:quit_smoking/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class InsertSmokingInfoPage5 extends StatefulWidget {
  final DateTime selectedStartSmokingDate;
  final DateTime selectedStartQuitSomkingDate;
  final int countperDay;
  final int price;

  const InsertSmokingInfoPage5({
    required this.selectedStartSmokingDate,
    required this.selectedStartQuitSomkingDate,
    required this.countperDay,
    required this.price,
    super.key,
  });

  @override
  State<InsertSmokingInfoPage5> createState() => _InsertSmokingInfoPage5State();
}

class _InsertSmokingInfoPage5State extends State<InsertSmokingInfoPage5> {
  double tar = 0.0;
  double nicotine = 0.0;
  final GlobalKey<FormState> formKey = GlobalKey();

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
                  '담배 한개피에 들어있는 타르량은 어떻게 되나요?',
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
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                    ],
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      suffixText: 'mg',
                      hintText: '5.5',
                    ),
                    onSaved: (String? val) {
                      tar = double.parse(val!);
                    },
                    validator: mgValidator,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  '담배 한개피에 들어있는 니코틴량은 어떻게 되나요?',
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
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                    ],
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      suffixText: 'mg',
                      hintText: '0.55',
                    ),
                    onSaved: (String? val) {
                      nicotine = double.parse(val!);
                    },
                    validator: mgValidator,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await saveParameter();
                            //Navigator.popUntil(context, ModalRoute.withName("/"));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => RootScreen()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        child: const Text('완료'),
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

  String? mgValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요.';
    }

    double? number;

    try {
      number = double.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요.';
    }

    if (number <= 0) {
      return '0 이상의 값을 입력해주세요.';
    }
  }

  Future<void> saveParameter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String startSmokingDateStr =
        widget.selectedStartSmokingDate.toIso8601String();
    await prefs.setString('startsmokingdate', startSmokingDateStr);

    String startQuitDateStr =
        widget.selectedStartQuitSomkingDate.toIso8601String();
    await prefs.setString('startquitdate', startQuitDateStr);

    await prefs.setInt('smokecount', widget.countperDay);
    await prefs.setInt('price', widget.price);
    await prefs.setDouble('tar', tar);
    await prefs.setDouble('nicotine', nicotine);

    print("save parameter");
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'insert_smoking_info_page1.dart';
import 'main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? startQuitDate;
  DateTime? startSmokingDate;
  int smokeCount = 0;
  int price = 0;
  double tar = 0;
  double nicotine = 0;
  bool isFirstTime = true;

  @override
  void initState() {
    loadQuitSomokingInfo();
    print('in initState() ');
    super.initState();
  }

  void loadQuitSomokingInfo() async {
    print('first intering loadQuitSomokingInfo()');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? startQuitDateString = prefs.getString('startquitdate');
    if (startQuitDateString != null) {
      startQuitDate = DateTime.parse(startQuitDateString);
      isFirstTime = false;
      print("startQuitDate is not null man");
    } else {
      isFirstTime = true;
      print("startQuitDate is null yhea");
      return;
    }
    final String? startSmokingDateString = prefs.getString('startsmokingdate');
    if (startSmokingDateString != null) {
      startSmokingDate = DateTime.parse(startSmokingDateString);
    }
    smokeCount = prefs.getInt('smokecount')!;
    price = prefs.getInt('price')!;
    tar = prefs.getDouble('tar')!;
    nicotine = prefs.getDouble('nicotine')!;
    print('tar = > $tar');
    print('빌드=====================');
    if(isFirstTime == false) {
      print('빌드 >>>>>>>> isFirstTime == false < OK >');
    } else {
      print('빌드 >>>>>>>> isFirstTime == true < NOT OK >');
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print('[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]');
    //loadQuitSomokingInfo();

    if(isFirstTime == false) {
      print('빌드 ====== isFirstTime == false < OK >');
    } else {
      print('빌드 ====== isFirstTime == true < NOT OK >');
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 15.0),
        child: isFirstTime == true ? InsertInfo() :
        MainPage(
          startQuitDate: startQuitDate,
          startSmokingDate: startSmokingDate,
          smokeCount: smokeCount,
          price: price,
          tar: tar,
          nicotine: nicotine,
        ),
      ),
    );
  }

  Widget InsertInfo() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => InsertSmokingInfoPage1(),
          )).then((value) {
            setState(() {
              print('Navigator => setState()');
            });
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        child: const Text(
          '흡연 시작일 입력하기',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

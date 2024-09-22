import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_smoking/screens/insert_smoking_info_page1.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DateTime? startQuitDate;
  DateTime? startSmokingDate;
  int smokeCount = 0;
  int price = 0;
  double tar = 0;
  double nicotine = 0;
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    //SharedPreferences.setMockInitialValues({});
  }

  Future<void> loadQuitSomokingInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? startQuitDateString = prefs.getString('startquitdate');
    if (startQuitDateString != null) {
      startQuitDate = DateTime.parse(startQuitDateString);
      isFirstTime = false;
    } else {
      isFirstTime = true;
      return;
    }
    String? startSmokingDateString = prefs.getString('startsmokingdate');
    if (startSmokingDateString != null) {
      startSmokingDate = DateTime.parse(startSmokingDateString);
    }
    smokeCount = prefs.getInt('smokecount')!;
    price = prefs.getInt('price')!;
    tar = prefs.getDouble('tar')!;
    nicotine = prefs.getDouble('nicotine')!;
  }

  @override
  Widget build(BuildContext context) {
    loadQuitSomokingInfo();

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 15.0),
        child: isFirstTime == true
            ? InsertInfo()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '금연 시작일',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${startQuitDate!.year}년 ${startQuitDate!.month}월 ${startQuitDate!.day}일',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showQuitSmokingDateDialog();

                                  setState(() {
                                    print('in onpress setstate');
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '흡연 시작일',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${startSmokingDate!.year}년 ${startSmokingDate!.month}월 ${startSmokingDate!.day}일',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showStartSomokingDateDialog();

                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '담배 한갑 가격',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '$price 원',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showPriceDialog();

                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '하루 평균 흡연량',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${smokeCount} 개비',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showCountCigDialog();
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '1개비 타르 양',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${tar} mg',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showTarDialog();
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '1개비 니코틴 양',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${nicotine} mg',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await showNicotineDialog();
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  '변경',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
          ));
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

  Future<void> showQuitSmokingDateDialog() async {
    DateTime selectedDate = startQuitDate!;

    String formattedDate =
        '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일';

    String? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                //padding: EdgeInsets.all(10.0),
                width: 450,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '금연을 언제부터 시작하시겠나요?',
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
                                  initialDateTime: startQuitDate,
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
                  ],
                ),
              ),
            );
          });
        }).whenComplete(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      startQuitDate = selectedDate;
      String startQuitDateStr = startQuitDate!.toIso8601String();
      await prefs.setString('startquitdate', startQuitDateStr);
      setState(() {});
    });
  }

  Future<void> showStartSomokingDateDialog() async {
    DateTime selectedDate = startSmokingDate!;

    String formattedDate =
        '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일';

    String? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                //padding: EdgeInsets.all(10.0),
                width: 450,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '흡연을 언제부터 시작하셨나요?',
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
                                  initialDateTime: startSmokingDate,
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
                  ],
                ),
              ),
            );
          });
        }).whenComplete(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      startSmokingDate = selectedDate;
      String startSmokingDateStr = startSmokingDate!.toIso8601String();
      await prefs.setString('startquitdate', startSmokingDateStr);
      setState(() {});
    });
  }

  Future<void> showPriceDialog() async {
    final GlobalKey<FormState> formKey = GlobalKey();
    await showDialog<String>(
      context: context,

      /// 다이얼로그 배경을 터치했을 때 다이얼로그를 닫을지 말지 결정
      /// true = 닫을 수 있음, false = 닫을 수 없음
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          /// 다이얼로그의 모양 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          /// 다이얼로그의 위치 설정, 기본값은 center
          alignment: Alignment.center,

          /// Dialog의 padding 값입니다..
          /// sizedBox의 가로세로 값읠 infinity로 설정해놓고
          /// 가로패딩 50, 세로 패딩 200을 줬습니다.
          /// 이렇게 하면 좌우 50, 위아래 200만큼의 패딩이 생기고 배경이 나오게 됩니다.
          /// 여기서 vertical의 값을 많이 주면,
          /// 키보드가 올라왔을 때 공간이 부족해서 overflow가 발생할 수 있습니다.
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),

          /// 소프트키보드가 올라왔을 때 다이얼로그의 사이즈가 조절되는 시간
          insetAnimationDuration: const Duration(milliseconds: 1000),

          /// 소프트키보드가 올라왔을 때 다이얼로그 사이즈 변경 애니메이션
          insetAnimationCurve: Curves.bounceOut,

          child: Form(
            key: formKey,
            child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      width: 130,
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
                          if(val == null || val == '') {
                            val = '0';
                          }
                          price = int.parse(val!);
                        },
                        //validator: priceValidator,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            /// Navigator.pop에서 result값을 넣어주면
                            /// showDialog의 return 값이 됩니다.
                            Navigator.pop(context, "return value");
                          },
                          child: const Text("확인")),
                    ),
                  ],
                )),
          ),
        );
      },
    ).then((value) {
      /// Navigator.pop 의 return 값이 들어옵니다.
    }).whenComplete(() async {
      /// 다이얼로그가 종료됐을 때 호출됩니다.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('price', price);
      setState(() {});
    });
  }

  Future<void> showCountCigDialog() async {
    final GlobalKey<FormState> formKey = GlobalKey();
    await showDialog<String>(
      context: context,

      /// 다이얼로그 배경을 터치했을 때 다이얼로그를 닫을지 말지 결정
      /// true = 닫을 수 있음, false = 닫을 수 없음
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          /// 다이얼로그의 모양 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          /// 다이얼로그의 위치 설정, 기본값은 center
          alignment: Alignment.center,

          /// Dialog의 padding 값입니다..
          /// sizedBox의 가로세로 값읠 infinity로 설정해놓고
          /// 가로패딩 50, 세로 패딩 200을 줬습니다.
          /// 이렇게 하면 좌우 50, 위아래 200만큼의 패딩이 생기고 배경이 나오게 됩니다.
          /// 여기서 vertical의 값을 많이 주면,
          /// 키보드가 올라왔을 때 공간이 부족해서 overflow가 발생할 수 있습니다.
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),

          /// 소프트키보드가 올라왔을 때 다이얼로그의 사이즈가 조절되는 시간
          insetAnimationDuration: const Duration(milliseconds: 1000),

          /// 소프트키보드가 올라왔을 때 다이얼로그 사이즈 변경 애니메이션
          insetAnimationCurve: Curves.bounceOut,

          child: Form(
            key: formKey,
            child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '하루에 답배 몇 개비를 피우시나요?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 130,
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
                          suffixText: '개비',
                        ),
                        onSaved: (String? val) {
                          if(val == null || val == '') {
                            val = '0';
                          }
                          smokeCount = int.parse(val!);
                        },
                        //validator: priceValidator,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            /// Navigator.pop에서 result값을 넣어주면
                            /// showDialog의 return 값이 됩니다.
                            Navigator.pop(context, "return value");
                          },
                          child: const Text("확인")),
                    ),
                  ],
                )),
          ),
        );
      },
    ).then((value) {
      /// Navigator.pop 의 return 값이 들어옵니다.
    }).whenComplete(() async {
      /// 다이얼로그가 종료됐을 때 호출됩니다.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('smokecount', smokeCount);
      setState(() {});
    });
  }

  Future<void> showTarDialog() async {
    final GlobalKey<FormState> formKey = GlobalKey();
    await showDialog<String>(
      context: context,

      /// 다이얼로그 배경을 터치했을 때 다이얼로그를 닫을지 말지 결정
      /// true = 닫을 수 있음, false = 닫을 수 없음
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          /// 다이얼로그의 모양 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          /// 다이얼로그의 위치 설정, 기본값은 center
          alignment: Alignment.center,

          /// Dialog의 padding 값입니다..
          /// sizedBox의 가로세로 값읠 infinity로 설정해놓고
          /// 가로패딩 50, 세로 패딩 200을 줬습니다.
          /// 이렇게 하면 좌우 50, 위아래 200만큼의 패딩이 생기고 배경이 나오게 됩니다.
          /// 여기서 vertical의 값을 많이 주면,
          /// 키보드가 올라왔을 때 공간이 부족해서 overflow가 발생할 수 있습니다.
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),

          /// 소프트키보드가 올라왔을 때 다이얼로그의 사이즈가 조절되는 시간
          insetAnimationDuration: const Duration(milliseconds: 1000),

          /// 소프트키보드가 올라왔을 때 다이얼로그 사이즈 변경 애니메이션
          insetAnimationCurve: Curves.bounceOut,

          child: Form(
            key: formKey,
            child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '담배 한 개비에 포함된 타르량이 어떻게 되나요?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 130,
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
                          suffixText: 'mg',
                        ),
                        onSaved: (String? val) {
                          if(val == null || val == '') {
                            val = '0';
                          }
                          tar = double.parse(val!);
                        },
                        //validator: priceValidator,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            /// Navigator.pop에서 result값을 넣어주면
                            /// showDialog의 return 값이 됩니다.
                            Navigator.pop(context, "return value");
                          },
                          child: const Text("확인")),
                    ),
                  ],
                )),
          ),
        );
      },
    ).then((value) {
      /// Navigator.pop 의 return 값이 들어옵니다.
    }).whenComplete(() async {
      /// 다이얼로그가 종료됐을 때 호출됩니다.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('tar', tar);
      setState(() {});
    });
  }

  Future<void> showNicotineDialog() async {
    final GlobalKey<FormState> formKey = GlobalKey();
    await showDialog<String>(
      context: context,

      /// 다이얼로그 배경을 터치했을 때 다이얼로그를 닫을지 말지 결정
      /// true = 닫을 수 있음, false = 닫을 수 없음
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          /// 다이얼로그의 모양 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          /// 다이얼로그의 위치 설정, 기본값은 center
          alignment: Alignment.center,

          /// Dialog의 padding 값입니다..
          /// sizedBox의 가로세로 값읠 infinity로 설정해놓고
          /// 가로패딩 50, 세로 패딩 200을 줬습니다.
          /// 이렇게 하면 좌우 50, 위아래 200만큼의 패딩이 생기고 배경이 나오게 됩니다.
          /// 여기서 vertical의 값을 많이 주면,
          /// 키보드가 올라왔을 때 공간이 부족해서 overflow가 발생할 수 있습니다.
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),

          /// 소프트키보드가 올라왔을 때 다이얼로그의 사이즈가 조절되는 시간
          insetAnimationDuration: const Duration(milliseconds: 1000),

          /// 소프트키보드가 올라왔을 때 다이얼로그 사이즈 변경 애니메이션
          insetAnimationCurve: Curves.bounceOut,

          child: Form(
            key: formKey,
            child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '담배 한 개비에 포함된 니코틴량이 어떻게 되나요?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 130,
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
                          suffixText: 'mg',
                        ),
                        onSaved: (String? val) {
                          if(val == null || val == '') {
                            val = '0';
                          }
                          nicotine = double.parse(val!);
                        },
                        //validator: priceValidator,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            /// Navigator.pop에서 result값을 넣어주면
                            /// showDialog의 return 값이 됩니다.
                            Navigator.pop(context, "return value");
                          },
                          child: const Text("확인")),
                    ),
                  ],
                )),
          ),
        );
      },
    ).then((value) {
      /// Navigator.pop 의 return 값이 들어옵니다.
    }).whenComplete(() async {
      /// 다이얼로그가 종료됐을 때 호출됩니다.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('nicotine', nicotine);
      setState(() {});
    });
  }
}

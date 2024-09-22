import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  DateTime? startQuitDate;
  DateTime? startSmokingDate;
  int smokeCount = 0;
  int price = 0;
  double tar = 0;
  double nicotine = 0;

  MainPage({
    required this.startQuitDate,
    required this.startSmokingDate,
    required this.smokeCount,
    required this.price,
    required this.tar,
    required this.nicotine,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          'assets/img/main_image.jpg',
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20.0,),

      ],
    );
  }

  Widget showStartQuitDate() {

    return Placeholder();
  }
}

class InputBanner extends StatelessWidget {
  final String title;
  final String message;

  const InputBanner({required this.title, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


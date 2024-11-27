import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  const LottiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset('assets/money.json'),
          Lottie.network(
            'https://telegram.org/file/464001484/1/bzi7gr7XRGU.10147/815df2ef527132dd23',
            decoder: LottieComposition.decodeGZip,
          ),
        ],
      ),
    ));
  }
}

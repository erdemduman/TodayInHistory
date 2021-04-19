import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final loadingText;

  LoadingView({required this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPouringHourglass(color: Colors.white, size: 70),
          SizedBox(height: 10),
          Text(loadingText, style: TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}

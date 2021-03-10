import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final String display;
  const LoadingPage({Key key, this.display}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(display),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

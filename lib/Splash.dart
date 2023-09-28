import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  void _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.electric_bolt_sharp,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Flash News',
                style: TextStyle(
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'PEPSI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

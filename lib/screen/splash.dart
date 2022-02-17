import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screen/dashboard.dart';
import 'package:lottie/lottie.dart';

class Spash extends StatefulWidget {
  const Spash({Key key}) : super(key: key);

  @override
  _SpashState createState() => _SpashState();
}

class _SpashState extends State<Spash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 0, end: 2).animate(controller)
      ..addListener(() {
        setState(() {
          controller.forward();
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/92331-sales-manager.json'),
              Text(
                "SELAMAT DATANG\nSOBAT TOGEL",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widget/curvercliper.dart';

import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ClipPath(
              clipper: CurverCliper(),
              child: Image(
                image: AssetImage('assets/images/login_background.jpg'),
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              'TEMENAN',
              style: TextStyle(
                  fontSize: 32.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30,
                    )),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    )),
              ),
            ),
            InkWell(
              onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard())),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                alignment: Alignment.center,
                height: 50.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, letterSpacing: 1.2),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "Dont, Have Account/ SignUp Here",
                    style: TextStyle(
                        color: Colors.black, fontSize: 12, letterSpacing: 1.2),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

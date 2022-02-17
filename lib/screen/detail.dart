import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:http/http.dart' as http;

class Detailku extends StatefulWidget {
  final String judul;
  final String deskripsi;
  final String gambar;

  const Detailku({
    Key key,
    this.judul,
    this.deskripsi,
    this.gambar,
  }) : super(key: key);
  @override
  _DetailkuState createState() => _DetailkuState();
}

class _DetailkuState extends State<Detailku> {
  //Theme Data
  ThemeData themeData;

  //Text Field Editing Controller
  TextEditingController nameTFController;
  TextEditingController emailTFController;
  TextEditingController passwordTFController;
  TextEditingController phone;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Other Variables
  bool showPassword = false;

  //UI Variables
  OutlineInputBorder allTFBorder;

  var loadingrs = false;
  // ignore: deprecated_member_use

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //     theme: AppTheme.getThemeFromThemeMode(themeType),
        home: Scaffold(
            key: _scaffoldKey,
            body: CustomScrollView(
              primary: true,
              shrinkWrap: false,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 180,
                  elevation: 0,
                  floating: true,
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: new IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                        ),
                      ]),
                      child:
                          new Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        Container(
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                            image: new NetworkImage(
                                'https://admin.dmrluxury.com/public/upload/slider/' +
                                    widget.gambar),
                            fit: BoxFit.fill,
                          )),
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.judul,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                fontFamily: 'Kali'
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 90,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deskripsi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Kali'
                                ),
                              ),
                              Divider(),
                              Text(
                                widget.deskripsi,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Kali'
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.width * 1.2,
                    ),
                  ),
                ]))
              ],
            )));
  }

/*
  void showMessage({String message = "Something wrong", Duration duration}) {
    if (duration == null) {
      duration = Duration(seconds: 3);
    }
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(message,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
  */
}

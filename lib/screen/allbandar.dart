import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/bandarmode.dart';
import 'package:flutter_social_ui/restapi/restapi.dart';
import 'package:flutter_social_ui/screen/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Allbandar extends StatefulWidget {
  const Allbandar({Key key}) : super(key: key);

  @override
  _AllbandarState createState() => _AllbandarState();
}

class _AllbandarState extends State<Allbandar> {
  var loadingevent = false;
  // ignore: deprecated_member_use
  final listbandar = new List<Listbandar>();
  var loadingdokter = false;
  List<Listbandar> _list = [];
  List<Listbandar> _search = [];

  tampildata() async {
    setState(() {
      loadingevent = true;
    });

    _list.clear();
    setState(() {
      loadingdokter = true;
    });

    final responsee = await http.get(Uri.parse(RestAPi.listbandar));
    if (responsee.statusCode == 200) {
      final data = jsonDecode(responsee.body);
      print(data);

      setState(() {
        for (Map i in data) {
          _list.add(Listbandar.fromJson(i));
          loadingdokter = false;
        }
      });
    } else {
      setState(() {
        loadingdokter = false;
      });
    }
  }

  TextEditingController controller = new TextEditingController();
  _onsearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _list.forEach((f) {
      if (f.judul.contains(text) || f.judul.contains(text)) _search.add(f);
    });
    setState(() {});
  }

  String _url = "";

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tampildata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
            backgroundColor: Colors.red,
            leading: new IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              icon: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, boxShadow: []),
                child: new Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
            title: Text("Daftar Bandar",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Kalilight',
                ))),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(

                        //Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0xffb6b6b6),
                            offset: Offset(
                              1,
                              1,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(
                          15,
                        ))),
                    height: 60,
                    padding: EdgeInsets.all(4.0),
                    margin: EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: controller,
                      //   onChanged: _onsearch,
                      autofocus: false,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Cari Bandar",
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.clear();
                            _onsearch('');
                          },
                          icon: Icon(Icons.search),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: loadingdokter
                            ? Center()
                            : Container(
                                child: _search.length != 0 ||
                                        controller.text.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: _search.length,
                                        itemBuilder: (context, i) {
                                          final dt = _search[i];

                                          return InkWell(
                                            onTap: () {
                                              print("asdasd");
                                            },
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffffff),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 2,
                                                            color: Color(
                                                                0xffb6b6b6),
                                                            offset: Offset(
                                                              3,
                                                              3,
                                                            ),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                          10,
                                                        ))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      6),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  new DecorationImage(
                                                                image: NetworkImage(
                                                                    'https://sultantimnas.com/public/upload/slider/' +
                                                                        dt.gambar,
                                                                    scale: 6),
                                                                fit:
                                                                    BoxFit.fill,

                                                                //alignment: Alignment.center
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20)),
                                                            ),
                                                            height: 90,
                                                            width: 100,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(dt.judul,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Kalilight',
                                                                )),
                                                            Text(dt.deskripsi,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Kalilight',
                                                                )),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            print(dt.link);
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 70,
                                                            child: Center(
                                                                child: Text(
                                                                    "Daftar")),
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black45,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              6),
                                                                      blurRadius:
                                                                          6.0)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                          );
                                        })
                                    : ListView.builder(
                                        itemCount: _list.length,
                                        itemBuilder: (context, i) {
                                          final dr = _list[i];

                                          return InkWell(
                                            onTap: () {
                                              print("asdasd");
                                            },
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 2,
                                                            color: Color(
                                                                0xffb6b6b6),
                                                            offset: Offset(
                                                              3,
                                                              3,
                                                            ),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                          10,
                                                        ))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      6),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  new DecorationImage(
                                                                image: NetworkImage(
                                                                    'https://sultantimnas.com/public/upload/slider/' +
                                                                        dr.gambar,
                                                                    scale: 6),
                                                                fit:
                                                                    BoxFit.fill,

                                                                //alignment: Alignment.center
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20)),
                                                            ),
                                                            height: 90,
                                                            width: 100,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(dr.judul,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontFamily:
                                                                        'Kalilight',
                                                                  )),
                                                              Text(dr.deskripsi,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Kalilight',
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _url = dr.link;
                                                              _launchURL();
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 70,
                                                            child: Center(
                                                                child: Text(
                                                                    "Daftar")),
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black45,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              6),
                                                                      blurRadius:
                                                                          6.0)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                          );
                                        }))),
                  )

                  //Column(children: newsList)
                ],
              ),
            )
          ],
        ));
  }
}

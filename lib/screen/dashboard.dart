import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/modelslider.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/restapi/restapi.dart';
import 'package:flutter_social_ui/screen/allbandar.dart';
import 'package:flutter_social_ui/screen/alldataharian.dart';
import 'package:flutter_social_ui/screen/livedraw.dart';
import 'package:flutter_social_ui/screen/statistik.dart';
import 'package:flutter_social_ui/widget/curvercliper.dart';
import 'package:flutter_social_ui/widget/customdrawer.dart';
import 'package:flutter_social_ui/widget/following.dart';
import 'package:flutter_social_ui/widget/post.dart';
import 'package:flutter_social_ui/models/post_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  String tgl = "";
  _buildOptiondrawer(Icon icon, String title, Function ontap) {
    return ListTile(
      leading: icon,
      onTap: ontap,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }

  var loadingslider = false;
  // ignore: deprecated_member_use
  final listslider = new List<Listslider>();
  List imageList;

  tampilslider() async {
    listslider.clear();
    setState(() {
      loadingslider = true;
    });
    final response = await http.get(Uri.parse(RestAPi.iklan));
    print(response);
    if (response.contentLength == 2) {
    } else {
      setState(() {
        imageList = jsonDecode(response.body);
        
        loadingslider = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    tgl = formattedDate;
    tampilslider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'FW ALVINO',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.grey, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
            child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Image(
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(currentUser.backgroundImageUrl),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Selamat Datang \nSobat Togel",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
            _buildOptiondrawer(
                Icon(Icons.home),
                "Home",
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()))),
            _buildOptiondrawer(
                Icon(Icons.room_preferences_outlined),
                "Bandar Terpercaya",
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Allbandar()))),
            //Data Live Draw
            ExpansionTile(
              title: Text("Live Draw"),
              leading: Icon(Icons.view_list),
              children: [
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Live Draw HK"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "1",
                                  tgl: tgl,
                                  namalive: "Live Draw HK",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Live Draw Sydney"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "4",
                                  tgl: tgl,
                                  namalive: "Live Draw SYDNEY",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Live Draw SGP Toto"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "2",
                                  tgl: tgl,
                                  namalive: "Live Draw SGP Toto",
                                )));
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Live Draw SGP4D"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "3",
                                  tgl: tgl,
                                  namalive: "Live Draw SGP4D",
                                )));
                  },
                ),
              ],
            ),
            //end live draw

            ExpansionTile(
              title: Text("Data Result Harian"),
              leading: Icon(Icons.view_list),
              children: [
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Data Result HK"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dataharian(
                                  int: "2",
                                  nama: "Data Harian HK",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Data Result Sydney"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dataharian(
                                  int: "6",
                                  nama: "Data Harian Sydney",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Data Result SGP Toto"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dataharian(
                                  int: "3",
                                  nama: "Data Harian SGP Toto",
                                )));
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Data Result SGP4D"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dataharian(
                                  int: "4",
                                  nama: "Data Harian SGP4D",
                                )));
                  },
                ),
              ],
            ),
            //Statistik Live Draw
            ExpansionTile(
              title: Text("Statistik Keluaran"),
              leading: Icon(Icons.cast_sharp),
              children: [
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Statistik HK"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Statistik(
                                  idlive: "6",
                                  tgl: tgl,
                                  idkop: "1",
                                  namalive: "Statistik HK",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Statistik Sydney"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Statistik(
                                  idlive: "5",
                                  tgl: tgl,
                                  idkop: "1",
                                  namalive: "Statistik Sydney",
                                )));
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Statistik SGP Toto"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Statistik(
                                  idlive: "8",
                                  tgl: tgl,
                                  idkop: "1",
                                  namalive: "Statistik SGP Toto",
                                )));
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 272,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.list_alt_outlined),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Statistik SGP4D"),
                            ],
                          ))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Statistik(
                                  idlive: "7",
                                  tgl: tgl,
                                  idkop: "1",
                                  namalive: "Statistik SGP4D",
                                )));
                  },
                ),
              ],
            ),
            //end live draw
          ],
        )),
      ),
      body: ListView(
        children: [
          ClipPath(
              clipper: CurverCliper(),
              child: Stack(
                children: [
                  /*
                  Image(
                    image: AssetImage('assets/images/login_background.jpg'),
                    height: MediaQuery.of(context).size.height / 4.5,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  */
                  Container(
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red,
                            Colors.black,
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Text(
                      "SELAMAT DATANG\nSobat Togel",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
          _sliderBanner(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "1",
                                  tgl: tgl,
                                  namalive: "Live Draw HK",
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.6,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 3)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red,
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 1.0,
                            right: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/togelhongkong.png'))),
                              height: 90,
                              width: 90,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Live Draw \nHK",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "4",
                                  tgl: tgl,
                                  namalive: "Live Draw SYDNEY",
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.6,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 3)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red,
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 1.0,
                            right: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage('assets/65956.png'))),
                              height: 90,
                              width: 90,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Live Draw \nSYDNEY",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "2",
                                  tgl: tgl,
                                  namalive: "Live Draw SGP Toto",
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.6,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 3)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red,
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 1.0,
                            right: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/singapura.png'))),
                              height: 90,
                              width: 90,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Live Draw \nSGP Toto",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Livedraw(
                                  idlive: "3",
                                  tgl: tgl,
                                  namalive: "Live Draw SGP4D",
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.6,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 3)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red,
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 1.0,
                            right: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/singapura.png'))),
                              height: 90,
                              width: 90,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Live Draw \nSGP4D",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Allbandar()));
              },
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 1.0,
                        right: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 200,
                          width: 200,
                        )),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 8,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logobandartogel.png')),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.red,
                        Colors.black,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          )
        ],
      ),
    );
  }


  _sliderBanner() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: loadingslider
          ? Center(
              child: Text("No Slider"),
            )
          : Carousel(
              boxFit: BoxFit.fill,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              borderRadius: true,
              radius: Radius.circular(8.0),
              moveIndicatorFromBottom: 180.0,
              noRadiusForIndicator: true,
              overlayShadow: true,
              overlayShadowColors: Colors.white,
              overlayShadowSize: 0.7,
              images: imageList.map((element) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detailku(
                                  judul: element['judul'],
                                  deskripsi: element['deskripsi'],
                                  gambar: element['gambar'],
                                )));
                  },
                  child: Image.network(
                    'https://sultantimnas.com/public/upload/slider/' +
                        element['gambar'],
                    fit: BoxFit.fill,
                  ),
                );
              }).toList(),
            ),
    );
  }

}

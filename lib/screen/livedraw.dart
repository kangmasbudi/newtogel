import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/modelconsolation.dart';
import 'package:flutter_social_ui/models/modelstarter.dart';
import 'package:flutter_social_ui/restapi/restapi.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Livedraw extends StatefulWidget {
  final String idlive;
  final String tgl;
  final String namalive;
  const Livedraw({Key key, this.namalive, this.idlive, this.tgl})
      : super(key: key);

  @override
  _LivedrawState createState() => _LivedrawState();
}

class _LivedrawState extends State<Livedraw> {
  String namaprize1 = "";
  String prize1 = "";
  String prize2 = "";
  String prize3 = "";
  String prize4 = "";
  String prize5 = "";
  String prize6 = "";

  //untuk prize2
  String namaprize2 = "";
  String pprize1 = "";
  String pprize2 = "";
  String pprize3 = "";
  String pprize4 = "";
  String pprize5 = "";
  String pprize6 = "";

  //untuk prize3
  String namaprize3 = "";
  String ppprize1 = "";
  String ppprize2 = "";
  String ppprize3 = "";
  String ppprize4 = "";
  String ppprize5 = "";
  String ppprize6 = "";

  getprize1() async {
    final response = await http.post(Uri.parse(RestAPi.getprize1), body: {
      "idlive": widget.idlive.toString(),
      "idprize": 2.toString(),
    });

    final data = jsonDecode(response.body);

    String value = data['value'];
    String tanggal = data['tanggal'];
    String namaprize = data['namapaket'];
    String blok1 = data['blok1'];
    String blok2 = data['blok2'];
    String blok3 = data['blok3'];
    String blok4 = data['blok4'];
    String blok5 = data['blok5'];
    String blok6 = data['blok6'];
    print(namaprize);
    setState(() {
      namaprize1 = namaprize;
      prize1 = blok1;
      prize2 = blok2;
      prize3 = blok3;
      prize4 = blok4;
      prize5 = blok5;
      prize6 = blok6;
      // ambilnamapaket();
    });
  }

  getprize2() async {
    final response = await http.post(Uri.parse(RestAPi.getprize2), body: {
      "idlive": widget.idlive.toString(),
      "idprize": 2.toString(),
    });

    final data = jsonDecode(response.body);

    String value = data['value'];
    String tanggal = data['tanggal'];
    String namaprizee = data['namapaket'];
    String bblok1 = data['blok1'];
    String bblok2 = data['blok2'];
    String bblok3 = data['blok3'];
    String bblok4 = data['blok4'];
    String bblok5 = data['blok5'];
    String bblok6 = data['blok6'];

    setState(() {
      namaprize2 = namaprizee;
      pprize1 = bblok1;
      pprize2 = bblok2;
      pprize3 = bblok3;
      pprize4 = bblok4;
      pprize5 = bblok5;
      pprize6 = bblok6;
      // ambilnamapaket();
    });
  }

  getprize3() async {
    final response = await http.post(Uri.parse(RestAPi.getprize3), body: {
      "idlive": widget.idlive.toString(),
      "idprize": 3.toString(),
    });

    final data = jsonDecode(response.body);

    String value = data['value'];
    String tanggal = data['tanggal'];
    String namaprizeee = data['namapaket'];
    String bbblok1 = data['blok1'];
    String bbblok2 = data['blok2'];
    String bbblok3 = data['blok3'];
    String bbblok4 = data['blok4'];
    String bbblok5 = data['blok5'];
    String bbblok6 = data['blok6'];

    setState(() {
      namaprize3 = namaprizeee;
      ppprize1 = bbblok1;
      ppprize2 = bbblok2;
      ppprize3 = bbblok3;
      ppprize4 = bbblok4;
      ppprize5 = bbblok5;
      ppprize6 = bbblok6;
      // ambilnamapaket();
    });
  }

  var loading = false;
  // ignore: deprecated_member_use
  final liststarter = new List<Liststarter>();

  var loadingc = false;
  // ignore: deprecated_member_use
  final listconsolation = new List<Listconsolation>();

  tampilstart() async {
    setState(() {
      loading = true;
      liststarter.clear();
    });
    final response = await http.post(Uri.parse(RestAPi.starter), body: {
      "idlive": widget.idlive.toString(),
    });
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      print(data);
      data.forEach((api) {
        final exp = new Liststarter(api['id'], api['result']);
        liststarter.add(exp);
      });
      setState(() {
        loading = false;
      });
    }
  }

  tampilconsolation() async {
    setState(() {
      loadingc = true;
      listconsolation.clear();
    });
    final response = await http.post(Uri.parse(RestAPi.consolation), body: {
      "idlive": widget.idlive.toString(),
    });
    if (response.contentLength == 2) {
    } else {
      final dataa = jsonDecode(response.body);
      print("ini dataconsolation");
      print(dataa);
      dataa.forEach((api) {
        final exxp = new Listconsolation(api['id'], api['result']);
        listconsolation.add(exxp);
      });
      setState(() {
        loadingc = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprize1();
    getprize2();
    getprize3();
    tampilstart();
    tampilconsolation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text("LiveDraw"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Column(
                          children: [
                            Text(
                              widget.namalive,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              widget.tgl,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              namaprize1,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Colors.red, Colors.black],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 6),
                              blurRadius: 6.0)
                        ]),
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize3,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize4,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize5,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            prize6,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),

                  //prize 2
                  Row(
                    children: [
                      Container(
                        child: Center(
                            child: Text(
                              namaprize2,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 6),
                                  blurRadius: 6.0)
                            ]),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize3,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize4,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize5,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            pprize6,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                  //prize3

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Center(
                            child: Text(
                              namaprize3,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 6),
                                  blurRadius: 6.0)
                            ]),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize3,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize4,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize5,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Colors.red, Colors.black],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ],
                            border: Border.all(width: 2, color: Colors.blue)),
                        child: Center(
                          child: Text(
                            ppprize6,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.red, Colors.black],
                      ),
                    ),
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "STARTER",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              height: 120,
                              width: double.infinity,
                              child: loading
                                  ? Center(
                                      child: LottieBuilder.asset(
                                          'assets/92541-loading.json'),
                                    )
                                  : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 2,
                                              crossAxisCount: 6),
                                      itemCount: liststarter.length,
                                      itemBuilder: (context, i) {
                                        final x = liststarter[i];

                                        return Container(
                                          height: 2,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Colors.red,
                                                  Colors.black
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            x.result,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        );
                                      },
                                    )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.red, Colors.black],
                      ),
                    ),
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "CONSOLATION",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              height: 120,
                              width: double.infinity,
                              child: loading
                                  ? Center(
                                      child: LottieBuilder.asset(
                                          'assets/92541-loading.json'),
                                    )
                                  : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 2,
                                              crossAxisCount: 6),
                                      itemCount: listconsolation.length,
                                      itemBuilder: (context, i) {
                                        final y = listconsolation[i];

                                        return Container(
                                          height: 2,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Colors.deepOrange,
                                                  Colors.black
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            y.result,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        );
                                      },
                                    )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

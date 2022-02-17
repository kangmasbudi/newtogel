import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/modelconsolation.dart';
import 'package:flutter_social_ui/models/modelstarter.dart';
import 'package:flutter_social_ui/restapi/restapi.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart' as chartskop;
import 'package:charts_flutter/flutter.dart' as chartskepala;
import 'package:charts_flutter/flutter.dart' as chartsekor;

class Statistik extends StatefulWidget {
  final String idlive;
  final String tgl;
  final String namalive;
  final String idkop;
  const Statistik({Key key, this.namalive, this.idkop, this.idlive, this.tgl})
      : super(key: key);

  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  var loadingc = false;

  List<Sales> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<Sales>.from(data.map((i) => Sales.fromMap(i)));
  }

  List<Sales> sale = [];
  Future<List<Sales>> getData() async {
    List<Sales> list = [];
    final responsechart = await http.post(Uri.parse(RestAPi.chart), body: {
      "idstatik": widget.idlive.toString(),
      "idkop": widget.idkop.toString(),
    });
    if (responsechart.contentLength == 2) {
    } else {
      list = fromJson(responsechart.body);
      setState(() {
        loadingc = false;
      });
    }
    return list;
  }

  static List<charts.Series<Sales, String>> chartData(List<Sales> data) {
    return [
      charts.Series<Sales, String>(
        id: "KOP",
        domainFn: (Sales s, _) => s.parameter,
        measureFn: (Sales s, _) => s.jumlah,
        data: data,
      )
    ];
  }

//untuk kop
  List<Saleskop> fromJsonkop(String strJson) {
    final datakop = jsonDecode(strJson);
    return List<Saleskop>.from(datakop.map((i) => Saleskop.fromMap(i)));
  }

  List<Saleskop> salekop = [];
  Future<List<Saleskop>> getDatakop() async {
    List<Saleskop> listkop = [];
    final responsechartkop =
        await http.post(Uri.parse(RestAPi.chartkop), body: {
      "idstatik": widget.idlive.toString(),
      "idkop": "2",
    });
    if (responsechartkop.contentLength == 2) {
    } else {
      listkop = fromJsonkop(responsechartkop.body);

      setState(() {
        loadingc = false;
      });
    }
    return listkop;
  }

  static List<chartskop.Series<Saleskop, String>> chartDatakop(
      List<Saleskop> datakop) {
    return [
      chartskop.Series<Saleskop, String>(
        id: "KOP",
        domainFn: (Saleskop s, _) => s.parameter,
        measureFn: (Saleskop s, _) => s.jumlah,
        data: datakop,
      )
    ];
  }
//end kop

//untuk kepala

  List<Saleskepala> fromJsonkepala(String strJson) {
    final datakepala = jsonDecode(strJson);
    return List<Saleskepala>.from(
        datakepala.map((i) => Saleskepala.fromMap(i)));
  }

  List<Saleskepala> salekepala = [];
  Future<List<Saleskepala>> getDatakepala() async {
    List<Saleskepala> listkepala = [];
    final responsechartkepala =
        await http.post(Uri.parse(RestAPi.chartkepala), body: {
      "idstatik": widget.idlive.toString(),
      "idkop": "3",
    });
    if (responsechartkepala.contentLength == 2) {
    } else {
      listkepala = fromJsonkepala(responsechartkepala.body);
      print("ini data kepala");
      print(responsechartkepala.body);
      setState(() {
        loadingc = false;
      });
    }
    return listkepala;
  }

  static List<chartskepala.Series<Saleskepala, String>> chartDatakepala(
      List<Saleskepala> datakepala) {
    return [
      chartskepala.Series<Saleskepala, String>(
        id: "KOP",
        domainFn: (Saleskepala s, _) => s.parameter,
        measureFn: (Saleskepala s, _) => s.jumlah,
        data: datakepala,
      )
    ];
  }

//end kepala

//untuk ekor

  List<Salesekor> fromJsonekor(String strJson) {
    final dataekor = jsonDecode(strJson);
    return List<Salesekor>.from(dataekor.map((i) => Salesekor.fromMap(i)));
  }

  List<Salesekor> saleekor = [];
  Future<List<Salesekor>> getDataekor() async {
    List<Salesekor> listekor = [];
    final responsechartekor =
        await http.post(Uri.parse(RestAPi.chartekor), body: {
      "idstatik": widget.idlive.toString(),
      "idkop": "3",
    });
    if (responsechartekor.contentLength == 2) {
    } else {
      listekor = fromJsonekor(responsechartekor.body);
      print("ini data ekor");
      print(responsechartekor.body);
      setState(() {
        loadingc = false;
      });
    }
    return listekor;
  }

  static List<chartsekor.Series<Salesekor, String>> chartDataekor(
      List<Salesekor> dataekor) {
    return [
      chartsekor.Series<Salesekor, String>(
        id: "KOP",
        domainFn: (Salesekor s, _) => s.parameter,
        measureFn: (Salesekor s, _) => s.jumlah,
        data: dataekor,
      )
    ];
  }

//end ekor

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) => sale = value);
    getDatakop().then((value) => salekop = value);
    getDatakepala().then((value) => salekepala = value);
    getDataekor().then((value) => saleekor = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.namalive),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text("AS"),
                    SizedBox(
                        height: 150,
                        child: charts.BarChart(
                          chartData(sale),
                          animate: true,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ganjil",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Genap",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text("KOP"),
                    SizedBox(
                        height: 150,
                        child: chartskop.BarChart(
                          chartDatakop(salekop),
                          animate: true,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ganjil",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Genap",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text("KEPALA"),
                    SizedBox(
                        height: 150,
                        child: chartskepala.BarChart(
                          chartDatakepala(salekepala),
                          animate: true,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ganjil",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Genap",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text("EKOR"),
                    SizedBox(
                        height: 150,
                        child: chartsekor.BarChart(
                          chartDataekor(saleekor),
                          animate: true,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ganjil",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Genap",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sales {
  final String parameter;
  final int jumlah;
  Sales({this.parameter, this.jumlah});
  factory Sales.fromMap(Map<String, dynamic> map) {
    return Sales(parameter: map['parameter'], jumlah: int.parse(map['jumlah']));
  }
}

class Saleskop {
  final String parameter;
  final int jumlah;
  Saleskop({this.parameter, this.jumlah});
  factory Saleskop.fromMap(Map<String, dynamic> map) {
    return Saleskop(
        parameter: map['parameter'], jumlah: int.parse(map['jumlah']));
  }
}

class Saleskepala {
  final String parameter;
  final int jumlah;
  Saleskepala({this.parameter, this.jumlah});
  factory Saleskepala.fromMap(Map<String, dynamic> map) {
    return Saleskepala(
        parameter: map['parameter'], jumlah: int.parse(map['jumlah']));
  }
}

class Salesekor {
  final String parameter;
  final int jumlah;
  Salesekor({this.parameter, this.jumlah});
  factory Salesekor.fromMap(Map<String, dynamic> map) {
    return Salesekor(
        parameter: map['parameter'], jumlah: int.parse(map['jumlah']));
  }
}

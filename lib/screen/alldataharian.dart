import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/modeldataharian.dart';
import 'package:flutter_social_ui/restapi/restapi.dart';
import 'package:http/http.dart' as http;

class Dataharian extends StatefulWidget {
  final String int;
  final String nama;
  const Dataharian({Key key, this.nama, this.int}) : super(key: key);

  @override
  _DataharianState createState() => _DataharianState();
}

class _DataharianState extends State<Dataharian> {
  var loadingevent = false;
  // ignore: deprecated_member_use
  final listbandar = new List<Listdataharian>();
  var loadingdokter = false;
  List<Listdataharian> _list = [];
  List<Listdataharian> _search = [];

  tampil() async {
    setState(() {
      loadingevent = true;
    });
    _list.clear();
    setState(() {
      loadingdokter = true;
    });
    final response = await http.post(Uri.parse(RestAPi.daftarharian), body: {
      "idlive": widget.int.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);

      setState(() {
        for (Map i in data) {
          _list.add(Listdataharian.fromJson(i));
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
      if (f.result.contains(text) || f.hari.contains(text)) _search.add(f);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ini id");
    print(widget.int.toString());
    tampil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.nama),
      ),
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
                      hintText: "Cari Result/Hari",
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
                                          onTap: () {},
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
                                                      color: Color(0xffffffff),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 2,
                                                          color:
                                                              Color(0xffb6b6b6),
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
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(dt.hari,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                          Text(dt.result,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("Tanggal :"),
                                                          Text(dt.tanggal,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                        ],
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
                                          onTap: () {},
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
                                                      color: Color(0xffffffff),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 2,
                                                          color:
                                                              Color(0xffb6b6b6),
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
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(dr.hari,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                          Text(dr.result,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("Tanggal :"),
                                                          Text(dr.tanggal,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Kalilight',
                                                              )),
                                                        ],
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
      ),
    );
  }
}

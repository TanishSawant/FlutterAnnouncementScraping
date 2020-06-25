import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Quote Scraper"),
      ),
      body: MianScreen(),
    );
  }
}

class MianScreen extends StatefulWidget {
  @override
  _MianScreenState createState() => _MianScreenState();
}

class _MianScreenState extends State<MianScreen> {
  int _itemCount = 0;

  var jsonResponse;

  String _Query;

  Future<void> getlinks() async {
    String url = "http://college-scrapper.herokuapp.com";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        jsonResponse = convert.jsonDecode(response.body);
        _itemCount = jsonResponse.length;
      });
//      jsonResponse[0]["author"]; = author name
//      jsonResponse[0]["quote"]; = links text
      print(jsonResponse.toString());
      print("Number of links found : $_itemCount.");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("RECRUITEMENT:", style: TextStyle(fontSize: 24.0),),
                              Text(
                                jsonResponse['Advt-Recruitement'][
                                  index
                                ],
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("COVID-19:", style: TextStyle(fontSize: 24.0),),
                              Text(
                                jsonResponse['COVID-19'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("DIPLOMA", style: TextStyle(fontSize: 24.0),),
                              Text(
                                jsonResponse['DIPLOMA'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("DEGREE", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['DEGREE'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("EXAM SECTION:", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['Exam_Section'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Notice", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['Notice'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("VJTI TENDERS:", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['VJTI_Tenders'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("WORKSHOP", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['Workshop'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("COMPONENT", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['component'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("NOTICES", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['notices'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              height: _itemCount == 0 ? 50 : 350,
              child: _itemCount == 0
                  ? Text("Loading...")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black54,
                                  
                                )
                              )
                             ),
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10.0),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("MOOC", style: TextStyle(fontSize: 24.0)),
                              Text(
                                jsonResponse['mooc'][
                                  index
                                ],//["quote"], //quote
                                style: TextStyle(color: Colors.black87,
                                fontSize: 18.0
                              ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: _itemCount+1,
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  ButtonTheme(
                    minWidth: 100,
                    child: RaisedButton(
                      child: Text(
                        "get links",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black87,
                      onPressed: () {
                        getlinks();
                        setState(() {
                          _itemCount = 0;
                        });
                      },
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
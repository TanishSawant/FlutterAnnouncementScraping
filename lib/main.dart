import 'dart:collection';
//import 'package:url_launcher/url_launcher.dart' as urlL;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


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
        title: Text("Link Scraper"),
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

  void initState() {
    super.initState();
    getlinks();
  }
  
  final Map<String, bool> _visible = {
    "Advt-Recruitement": false,
    "COVID-19": false,
    "DIPLOMA": false,
    "DEGREE": false,
    "EXAM_SECTION": false,
    "NOTICE": false,
    "VJTI_TENDERS": false,
    "WORKSHOP": false,
    "COMPONENT": false,
    "NOTICES": false,
    "MOOC": false,
  };

  void toggleVisibility(String a){
    setState(() {
      _visible[a] = !_visible[a];
    });
  }
  
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

      print(jsonResponse.toString());
      print("Number of links found : $_itemCount.");
      print("-------------------------------------------------------------------------");
      print(jsonResponse['Advt-Recruitement']);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("RECRUITEMENT:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["Advt-Recruitement"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("Advt-Recruitement")},
              )
              ]
              ),
              Visibility(
                  visible: _visible["Advt-Recruitement"],
                  child: Container(
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
                                  ListTile(title: Text("RECRUITEMENT:", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['Advt-Recruitement'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['Advt-Recruitement'][index]}"), _launchURL(jsonResponse['Advt-Recruitement'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("COVID-19:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["COVID-19"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("COVID-19")},
              )
              ]
              ),
              Visibility(
                visible: _visible["COVID-19"],
                  child: Container(
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
                                  ListTile(title: Text("COVID-19", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['COVID-19'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['COVID-19'][index]}"), _launchURL(jsonResponse['COVID-19'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("DIPLOMA:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["DIPLOMA"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("DIPLOMA")},
              )
              ]
              ),
              Visibility(
                visible: _visible["DIPLOMA"],
                              child: Container(
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
                                  ListTile(title: Text("DIPLOMA", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['DIPLOMA'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['DIPLOMA'][index]}"), _launchURL(jsonResponse['DIPLOMA'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("DEGREE:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["DEGREE"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("DEGREE")},
              )
              ]
              ),
              Visibility(
                visible: _visible["DEGREE"],
                              child: Container(
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
                                  ListTile(title: Text("DEGREE", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['DEGREE'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['DEGREE'][index]}"), _launchURL(jsonResponse['DEGREE'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("EXAM SECTION:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["EXAM_SECTION"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("EXAM_SECTION")},
              )
              ]
              ),
              Visibility(
                visible: _visible["EXAM_SECTION"],
                              child: Container(
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
ListTile(title: Text("EXAM_SECTION", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['Exam_Section'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['Exam_Section'][index]}"), _launchURL(jsonResponse['Exam_Section'][index].toString())},
                                  ),                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("NOTICE:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["NOTICE"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("NOTICE")},
              )
              ]
              ),
              Visibility(
                visible: _visible["NOTICE"],
                              child: Container(
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
                                  ListTile(title: Text("NOTICE", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['Notice'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['Notice'][index]}"), _launchURL(jsonResponse['Notice'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("VJTI TENDERS:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["VJTI_TENDERS"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("VJTI_TENDERS")},
              )
              ]
              ),
              Visibility(
                visible: _visible["VJTI_TENDERS"],
                              child: Container(
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
                                  ListTile(title: Text("VJTI_TENDERS", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['VJTI_Tenders'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['VJTI_Tenders'][index]}"), _launchURL(jsonResponse['VJTI_Tenders'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("WORKSHOP:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["WORKSHOP"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("WORKSHOP")},
              )
              ]
              ),
              Visibility(
                visible: _visible["WORKSHOP"],
                              child: Container(
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
                                  ListTile(title: Text("WORKSHOP", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['WORKSHOP'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['Advt-Recruitement'][index]}"), _launchURL(jsonResponse['WORKSHOP'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("COMPONENT:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["COMPONENT"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("COMPONENT")},
              )
              ]
              ),
              Visibility(
                visible: _visible["COMPONENT"],
                              child: Container(
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
                                  ListTile(title: Text("COMPONENT", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['component'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['component'][index]}"), _launchURL(jsonResponse['component'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("NOTICES:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["NOTICES"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("NOTICES")},
              )
              ]
              ),
              Visibility(
                visible: _visible["NOTICES"],
                              child: Container(
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
                                  ListTile(title: Text("NOTICES", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['notices'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['notices'][index]}"), _launchURL(jsonResponse['notices'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text("MOOCS:", style: TextStyle(fontSize: 24.0),),
              IconButton(
                icon: Icon(
                  _visible["MOOC"] == false?Icons.arrow_drop_down:Icons.arrow_drop_up
                ),
                onPressed: ()=>{toggleVisibility("MOOC")},
              )
              ]
              ),
              Visibility(
                visible: _visible["MOOC"],
                              child: Container(
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
                                  ListTile(title: Text("MOOC", style: TextStyle(fontSize: 24.0),),
                                  subtitle: Text(
                                    jsonResponse['mooc'][
                                      index
                                    ],
                                    style: TextStyle(color: Colors.black87,
                                    fontSize: 18.0
                                  ),
                                  ),
                                  onTap: () => {print("Clicked on ${jsonResponse['mooc'][index]}"), _launchURL(jsonResponse['mooc'][index].toString())},
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _itemCount+1,
                        ),
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

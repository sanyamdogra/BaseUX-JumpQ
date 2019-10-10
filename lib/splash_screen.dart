import 'package:flutter/material.dart';
import 'dart:async';

// import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final String storename;
  final String productname;
  final String quantity;
  final String date;

  Post({this.storename, this.productname, this.quantity, this.date});
  Map toMap() {
    var map = new Map<String, dynamic>();

    map["storename"] = storename;
    map["productname"] = productname;
    map["quantity"] = quantity;
    map["date"] = date;

    return map;
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      storename: json['storename'],
      productname: json['productname'],
      quantity: json['quantity'],
      date: json['date'],
    );
  }
}

Future<bool> fetchPost(url, {Map body}) async {
  Map<String, String> header = {"Content-type": "application/json"};
  // var
  // final response =
  //     await http.get('https://jsonplaceholder.typicode.com/posts/1');

  // return http
  //     .post(url, headers: headers, body: body)
  //     .then((http.Response response) {
  //   final int statusCode = response.statusCode;

  //   if (statusCode < 200 || statusCode > 400 || json == null) {
  //     print("Api call unsuck");
  //   }
  //   return Post.fromJson(json.decode(response.body));
  // });
  String json =
      '{"storename":"Planet Needs","productname":"Drink","quantity":"1","date":"2019-10-10T19:33:46.349Z"}';

  // var storeList = [
  //   {
  //     "storename": "24 Seven",
  //     "productname": 'RedBull',
  //     "quantity": "10",
  //     "date": "2019-10-10T19:33:46.349Z",
  //   },
  //   {
  //     "title": "Big Bazar",
  //     "productname": 'RedBull',
  //     "quantity": "10",
  //     "date": "2019-10-10T19:33:46.349Z",
  //   },
  //   {
  //     "title": "Planet Needs",
  //     "productname": 'RedBull',
  //     "quantity": "10",
  //     "date": "2019-10-10T19:33:46.349Z",
  //   },
    
  // ];
  http.Response response = await http.post(url, headers: header, body: json);

  int statusCode = response.statusCode;

  if (statusCode < 200 || statusCode > 400 || json == null) {
    print("Api call unsuck");
    return false;
  } else {
    print("Returned true");
    return true;
  }

  // if (response.statusCode == 200) {
  //   // If server returns an OK response, parse the JSON.
  //   return Post.fromJson(json.decode(response.body));
  // } else {
  //   // If that response was not OK, throw an error.
  //   throw Exception('Failed to load post');
  // }
}

class SplashScreen extends StatefulWidget {
  final Future<Post> post;
  SplashScreen({Key key, this.post}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
  // TextEditingController titleControler = new TextEditingController();
  // TextEditingController bodyControler = new TextEditingController();

  void runMyFuture() {
    Post newPost = new Post(
        storename: "Big",
        productname: "Lays",
        quantity: "100",
        date: "2019-10-10T19:33:46.349Z");

    fetchPost("https://jumpq-admin.herokuapp.com/product/add",
            body: newPost.toMap())
        .then((fetchPostResultsData) {
      if (fetchPostResultsData == true) {
        Navigator.of(context).pushReplacementNamed('/payment');
        print("Post Request Success!");
      }
    }).catchError((errorFromFetchPostResults) {
      print("ScoobyDoo");
      print(errorFromFetchPostResults);
    });
  }

  @override
  void initState() {
    super.initState();
    runMyFuture();
    // Timer(Duration(seconds: 3), () async {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.monetization_on,
                          color: const Color(0xFF0f117a),
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Processing Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Color(0xFF0f117a),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    // new RaisedButton(
                    //   onPressed: () async {
                    //     Post newPost = new Post(
                    //         userId: "1",
                    //         id: 0,
                    //         title: "titleControler.text",
                    //         body: "bodyControler.text");
                    //     Post p = await createPost(CREATE_POST_URL,
                    //         body: newPost.toMap());
                    //     print(p.title);
                    //   },
                    //   child: const Text("Create"),
                    // ),
                    // FutureBuilder<Post>(
                    //   future: fetchPost().then((fetchPostResultsData) {
                    //     if (fetchPostResultsData != null)

                    //         Navigator.of(context)
                    //             .pushReplacementNamed('/payment');

                    //   }).catchError((errorFromFetchPostResults) {
                    //     print(errorFromFetchPostResults);
                    //   }),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Text(snapshot.data.title);
                    //     } else if (snapshot.hasError) {
                    //       return Text("${snapshot.error}");
                    //     }

                    //     // By default, show a loading spinner.
                    //     return CircularProgressIndicator();
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amity_hack/tick_animation.dart';

class PaymentGreen extends StatefulWidget {
  @override
  _PaymentGreenState createState() => _PaymentGreenState();
}

class _PaymentGreenState extends State<PaymentGreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

    return Scaffold(
      backgroundColor: Color(0xFFA3CB37),
      appBar: AppBar(
        backgroundColor: Color(0xFFA3CB37),
        centerTitle: true,
        title: Text('Invoice'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 112),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                height: deviceSize.height / 1.26,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'DateTime:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bill No:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '73ab2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                           
                          ],
                        ),
                         SizedBox(
                              width: 150,
                            ),
                         Column(
                          children: <Widget>[
                            Text('3',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
                        
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: deviceSize.width,
                      color: Color(0xFFF8C436),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 25),
                          Text(
                            'Items',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: deviceSize.width / 1.9,
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    itemDetails(context, 'Haldiram Chips', '90g', 1, 5, 3.5),
                    SizedBox(
                      height: 30,
                    ),
                    itemDetails(context, 'Mountain Dew', '300ml', 1, 20, 3.8),
                    SizedBox(
                      height: 30,
                    ),
                    itemDetails(context, 'Fresca Mango', '50g', 1, 15,3.15),
                    SizedBox(
                      height: deviceSize.height / 16,
                    ),
                    Center(
                      child: Container(
                        child: ColorLoader3(
                          radius: 40.0,
                          dotRadius: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceSize.height / 7,
                    ),
                    Container(
                      height: 50,
                      width: deviceSize.width,
                      color: Color(0xFFF8C436),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 25),
                          Text(
                            'Total ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: deviceSize.width / 2.5,
                          ),
                          Text(
                            '₹40.0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemDetails(BuildContext context, String title, String weight,
    int quantity, double price, double distance) {
  var deviceSize = MediaQuery.of(context).size;
  var calcPrice = quantity * price;
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      height: 50,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$title $weight',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$quantity x  ₹$price',
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                width: deviceSize.width / distance,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 30,
                      width: 70,
                      child: Center(
                          child: Text(
                        '₹$calcPrice',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

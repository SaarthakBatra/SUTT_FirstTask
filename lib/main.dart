import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
  home: mainApp(),
  routes: {
    '/home': (context) => mainApp(),
    '/orderAbout': (context) => orderInfo(),
  },
));

class mainApp extends StatefulWidget {

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {

  List<OrderData> orderData =[
    OrderData(time: 'Pending', weight: 2, quant: 8, price: 1000),
    OrderData(time: 'Pending', weight: 2, quant: 6, price: 2000),
    OrderData(time: 'Pending', weight: 2, quant: 4, price: 3000),
    OrderData(time: 'Pending', weight: 2, quant: 2, price: 4000),
    OrderData(time: 'Pending', weight: 2, quant: 10, price: 5000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Expanded(child: Text('Orders', style: TextStyle(fontSize: 30),)),
              Expanded(child: Text('856', textAlign: TextAlign.right,)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: orderData.map((orderVal) => OrderCard(
                orderVal: orderVal,
                orderAccpt: () {
                  setState(() {
                    orderVal.time = 'Accepted';
                  });
                },
                orderDcln: () {
                  setState(() {
                    orderVal.time = 'Decline';
                  });
            }
            )).toList(),
          ),
        )
    );
  }
}

class OrderCard extends StatelessWidget {

  final OrderData orderVal;
  final VoidCallback orderAccpt;
  final VoidCallback orderDcln;
  OrderCard({ required this.orderVal, required this.orderAccpt, required this.orderDcln });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,'/orderAbout'),
      child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.grey[700],
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.width * 0.05, 0),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 1,
          //color: Colors.red,
          child: Row(

            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.50,
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                  //color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width * 0.03,0),
                                child: Icon(Icons.access_alarm_rounded)
                            ),
                            Text(
                              orderVal.time,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width * 0.03,0),
                                child: Icon(Icons.border_all),
                            ),
                            Text(
                              '> ${orderVal.weight} Kg',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width * 0.03,0),
                                child: Icon(Icons.add_business),
                            ),
                            Text(
                              'x ${orderVal.quant}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange[900],
                          ),
                          child: Text(
                            'Rs.${orderVal.price}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(                                                      //Food Picture
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage('assets/pexels-photo-1123260.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        //height: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                //margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.045, 0, MediaQuery.of(context).size.width * 0.1, 0),
                                child: ElevatedButton(
                                    onPressed: orderAccpt,
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown[300],
                                    shape: CircleBorder(),
                                    elevation: MediaQuery.of(context).size.width * 0.01,
                                  ),
                                    child: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: orderDcln,
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown[300],
                                    shape: CircleBorder(),
                                    elevation: MediaQuery.of(context).size.width * 0.01,
                                  ),
                                  child: Text(
                                      '-',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class orderInfo extends StatefulWidget {
  const orderInfo({Key? key}) : super(key: key);

  @override
  State<orderInfo> createState() => _orderInfoState();
}

class _orderInfoState extends State<orderInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
            'Details',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
        centerTitle: true,
        //elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //photo
            Container(                                                      //Food Picture
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage('assets/pexels-photo-1123260.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            ),
            //progress
            Container(
              height: MediaQuery.of(context).size.width * 0.45,
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: Row(
                children: [
                  //progressbar
                  Expanded(
                    flex: 50,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.width * 0.05),
                      child: CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        circularStrokeCap: CircularStrokeCap.round,
                        //linearGradient:
                        progressColor: Colors.orange[400],
                        radius: MediaQuery.of(context).size.width * 0.15,
                        lineWidth: MediaQuery.of(context).size.width * 0.025,
                        percent: .47,
                        center: Text(
                          '47%',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[850],
                            shape: CircleBorder(),
                            elevation: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Container(
                            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                            child: Icon(Icons.ac_unit),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[850],
                            shape: CircleBorder(),
                            elevation: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Container(
                            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                            child: Icon(Icons.account_balance_wallet_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //lightening
                  //search
                ],
              ),
            ),
            //data
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: Row(
                children: [
                  //Date
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Quantity
                  Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                            'Quantity',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                        ),
                      ),
                    ],
                  )
                ),

                  //Progress
                  Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                            'Progress',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderData {
  String time;
  int weight;
  int quant;
  int price;

  OrderData({ required this.time, required this.weight, required this.quant, required this.price});
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  bool activeOrdersSelected = true;
  bool completedOrdersSelected = false;
  late List<SingleOrderData> activeOrdersData;
  late List<SingleOrderData> completedOrdersData;

  @override
  void initState() {
    super.initState();
    fillDummyData();
  }

  void activeOrdersClickHandle() {
    setState(() {
      activeOrdersSelected = true;
      completedOrdersSelected = false;
    });
  }

  void completedOrdersClickHandle() {
    setState(() {
      activeOrdersSelected = false;
      completedOrdersSelected = true;
    });
  }

  void fillDummyData() {
    activeOrdersData = [];
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    activeOrdersData.add(SingleOrderData(
        "749",
        "Accepted",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));

    completedOrdersData = [];
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
    completedOrdersData.add(SingleOrderData(
        "749",
        "Completed",
        "Today 11 PM",
        "Maxwell Industries\nCherppu Thrissur\nKerala Pin 676519",
        SingleOrderSummary("Super Diesel", 50, "14 Monday 2021", 450000.00),
        false));
  }

  Widget _returnSingleOrderWidget(int position, SingleOrderData currentOrder) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16.0, right: 17.0, bottom: 12.0),
      decoration: BoxDecoration(
        gradient: new LinearGradient(stops: [
          0.018,
          0.018
        ], colors: [
          activeOrdersSelected ? Color(0xFF74b42f) : Color(0xFFf2642c),
          Colors.white
        ]),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 2.5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ExpansionTile(
        title: _headerWidget(currentOrder),
        maintainState: true,
        initiallyExpanded: currentOrder.isExpanded,
        onExpansionChanged: (isExpanded) {
          setState(() {
            if (activeOrdersSelected) {
              activeOrdersData[position].isExpanded =
                  !activeOrdersData[position].isExpanded;
            } else {
              completedOrdersData[position].isExpanded =
                  !completedOrdersData[position].isExpanded;
            }
          });
        },
        children: <Widget>[
          _expandedViewOfTile(currentOrder),
        ],
      ),
    );
  }

  Widget _headerWidget(SingleOrderData currentOrder) {
    return Container(
      margin: EdgeInsets.only(left: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'Order #' + currentOrder.orderId,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF818181),
                fontFamily: 'Poppins Medium',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              'Order ' + currentOrder.orderStatus,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF4A6A84),
                fontFamily: 'Poppins SemiBold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 37.0, bottom: 16.0),
            child: Text(
              currentOrder.time,
              style: TextStyle(
                fontSize: 13.0,
                color: Color(0xFF818181),
                fontFamily: 'Poppins SemiBold',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandedViewOfTile(SingleOrderData currentOrder) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 15.0),
            child: Text(
              'Address',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF024260),
                fontFamily: 'Poppins Medium',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 17.0, right: 16.0, top: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!.withOpacity(0.3),
                  spreadRadius: 1.5,
                  blurRadius: 2.5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 9.0, top: 25.0, bottom: 23.0),
              child: Text(
                currentOrder.address,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xFF464646),
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 32.0),
            child: Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF024260),
                fontFamily: 'Poppins Medium',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 12.0),
                child: Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF9B9B9B),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.0, top: 12.0),
                child: Text(
                  currentOrder.singleOrderSummary.type,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF4E4E4E),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 19.0),
                child: Text(
                  'QTY',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF9B9B9B),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.0, top: 19.0),
                child: Text(
                  currentOrder.singleOrderSummary.qty.toString() + 'L',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF4E4E4E),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 19.0),
                child: Text(
                  'Delivery Date',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF9B9B9B),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.0, top: 19.0),
                child: Text(
                  currentOrder.singleOrderSummary.deliveryDate,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF4E4E4E),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 31.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF696969),
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0,
                            bottom: activeOrdersSelected ? 76.0 : 0.0),
                        child: Text(
                          currentOrder.singleOrderSummary.totalPrice.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF024260),
                            fontFamily: 'Poppins Bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: completedOrdersSelected,
                  child: RaisedButton(
                    splashColor: Colors.green,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffF2642C),
                            Color(0xffFEA539),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(minWidth: 126.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Reorder",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins Bold",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          Visibility(
            visible: completedOrdersSelected,
            child: Container(
              height: 1.0,
              width: double.infinity,
              margin: EdgeInsets.only(left: 16.0, right: 17.0),
              color: Color(0xFFD1D1D1),
            ),
          ),
          Visibility(
            visible: completedOrdersSelected,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, top: 19.0),
              child: Text(
                'Rate',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF024260),
                  fontFamily: 'Poppins Medium',
                ),
              ),
            ),
          ),
          Visibility(
            visible: completedOrdersSelected,
            child: Container(
              height: 35.0,
              margin: EdgeInsets.only(
                top: 19.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 35.0,
                    width: 35.0,
                    color: Color(0xFFE2E2E2),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF5A5A5A),
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    color: Color(0xFFE2E2E2),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF5A5A5A),
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    color: Color(0xFFE2E2E2),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF5A5A5A),
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    color: Color(0xFFE2E2E2),
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF5A5A5A),
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    color: Color(0xFFE2E2E2),
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF5A5A5A),
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: completedOrdersSelected,
            child: Container(
              margin: EdgeInsets.only(left: 15.0, top: 18.0, right: 9.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey[50]!,
                  )),
                  hintText: 'Comment',
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF5A5A5A),
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: completedOrdersSelected,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF4712F)),
                ),
                margin: EdgeInsets.only(right: 9.0, top: 18.0, bottom: 14.0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  splashColor: Colors.blue[100],
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF5A5A5A),
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 2.5,
                    offset: Offset(0.0, 1.0),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 63.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9.0, bottom: 20.0),
                      child: Column(
                        children: [
                          InkWell(
                            child: Text(
                              "Active Orders",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat Regular",
                                fontWeight: FontWeight.bold,
                                color: activeOrdersSelected
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            splashColor: Colors.transparent,
                            onTap: activeOrdersClickHandle,
                          ),
                          Visibility(
                            visible: activeOrdersSelected,
                            child: Container(
                              height: 6.0,
                              width: 6.0,
                              margin: EdgeInsets.only(top: 5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF0727F),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9.0, bottom: 20.0),
                      child: Column(
                        children: [
                          InkWell(
                            child: Text(
                              "Completed Orders",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat Regular",
                                fontWeight: FontWeight.bold,
                                color: completedOrdersSelected
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            splashColor: Colors.transparent,
                            onTap: completedOrdersClickHandle,
                          ),
                          Visibility(
                            visible: completedOrdersSelected,
                            child: Container(
                              height: 6.0,
                              width: 6.0,
                              margin: EdgeInsets.only(top: 5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF0727F),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: activeOrdersSelected
                    ? activeOrdersData.length
                    : completedOrdersData.length,
                itemBuilder: (context, position) {
                  SingleOrderData currentOrder = activeOrdersSelected
                      ? activeOrdersData[position]
                      : completedOrdersData[position];
                  print("Amit Kirti " + currentOrder.isExpanded.toString());
                  return _returnSingleOrderWidget(position, currentOrder);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleOrderData {
  String orderId;
  String orderStatus; //completed/accepted/pending
  String time;
  String address;
  SingleOrderSummary singleOrderSummary;
  bool isExpanded;

  SingleOrderData(this.orderId, this.orderStatus, this.time, this.address,
      this.singleOrderSummary, this.isExpanded);
}

class SingleOrderSummary {
  String type;
  double qty;
  String deliveryDate;
  double totalPrice;

  SingleOrderSummary(this.type, this.qty, this.deliveryDate, this.totalPrice);
}

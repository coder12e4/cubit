import 'package:vfuel/models/home/configuration.dart';
import 'package:flutter/material.dart';

class FuelTypeWidget extends StatefulWidget {
  List<Product>? fuelProducts;

  FuelTypeWidget(List<Product> products, {Key? key, this.fuelProducts})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FuelTypeWidgetState();
  }
}

class _FuelTypeWidgetState extends State<FuelTypeWidget> {
  @override
  void initState() {
    super.initState();
    widget.fuelProducts = [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (Product product in widget.fuelProducts!)
            Container(
              margin: EdgeInsets.only(left: 25.0, top: 15.0),
              decoration: BoxDecoration(
                color: Color(0xFFF26412),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          product.name!,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat SemiBold',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat SemiBold',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage1/model/listmodel.dart';

class mycodingwidgets extends StatefulWidget {
  const mycodingwidgets({Key? key}) : super(key: key);

  @override
  _mycodingwidgetsState createState() => _mycodingwidgetsState();
}

class _mycodingwidgetsState extends State<mycodingwidgets> {
  List<ModelSpinner> spinnerList = [];
  ModelSpinner? obj_spinner;

  add() {
    spinnerList.add(ModelSpinner("shukoor", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("jaffer", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("shakir", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("harif", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("ashik", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("jasfia", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("sahla", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("anu", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("ajeeba", Icon(Icons.ac_unit)));
    spinnerList.add(ModelSpinner("aswathi", Icon(Icons.ac_unit)));
  }

  String? _radioValue; //Initial definition of radio button value
  String? choice;

  void radioButtonChanges(String? value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;

          // funtions write here

          String? a = "ggg";
          String? b = "hh";
          print(a + b);

          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
//      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  void initState() {
    add();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 46,
                width: 110,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 4),
                color: Colors.purple,
                child: DropdownButtonFormField<ModelSpinner>(
                  decoration: InputDecoration(enabledBorder: InputBorder.none),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  hint: Text("Drinks"),
                  value: obj_spinner,
                  // style: VFuelStyles.formTextStyle(),
                  onChanged: (value) {
                    obj_spinner = value;
                    //api call
                  },
                  items: spinnerList
                      .map<DropdownMenuItem<ModelSpinner>>((ModelSpinner v) {
                    return DropdownMenuItem<ModelSpinner>(
                      value: v,
                      child: Text(v.name!),
                    );
                  }).toList(),
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 'one',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "One selected",
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "two",
                      groupValue: _radioValue,
                      onChanged: radioButtonChanges),
                  Text("two ww")
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "three",
                      groupValue: _radioValue,
                      onChanged: radioButtonChanges),
                  Text("three ww")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

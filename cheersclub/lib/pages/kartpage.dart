import 'package:cheersclub/cubit/RestouretCart/restourent_cart_cubit.dart';
import 'package:cheersclub/cubit/repository/RestourentkartRepository.dart';
import 'package:cheersclub/models/cart/RestourentKartModel.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:cheersclub/widgets/drowers/drowers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:hexcolor/hexcolor.dart';

class Phone_no {
  final String name;
  final String no;
  Phone_no(this.name, this.no);
}

class Restourentcart extends StatefulWidget {
  final int? restorent_id;
  const Restourentcart({Key? key, this.restorent_id}) : super(key: key);

  @override
  _RestourentcartState createState() => _RestourentcartState();
}

class _RestourentcartState extends State<Restourentcart> {
  List<Phone_no> _phone_list = [];
  List<Contact>? _contacts = [];
  int _count = 1;
  String no = "";
  Contact? contact_obj;
  bool _permissionDenied = false;

  bool value = false;
  bool value_bussiness = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  var _chosenValue;
  late RestourentCartCubit restourentCartCubit;

  List<Cart>? cart = [];
  double? sutotal = 0.0;
  double? vat21 = 0.0;
  String? total = "0.0";

  Widget myAppBarIcon() {
    return Container(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 26,
          ),
          Container(
            width: 27,
            height: 30,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor("FFC853"),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double heght = 40;

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() {
        _contacts = contacts;
      });
    }
  }

  void _addNewContactRow() {
    setState(() {
      _count = _count + 1;
    });
  }

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return Container(
        height: 46,
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
        padding: EdgeInsets.only(left: 4),
        //color: HexColor("FEC753"),
        child: Row(
          children: [
            Container(
              color: HexColor("28292C"),
              width: 120,
              child: DropdownButtonFormField<Contact>(
                isExpanded: true,
                decoration: InputDecoration(enabledBorder: InputBorder.none),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                hint: Text(
                  "Contacts",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                value: contact_obj,
                style: TextStyle(color: Colors.white),
                onChanged: (value) async {
                  final fullContact =
                      await FlutterContacts.getContact(value!.id);

                  setState(() {
                    contact_obj = value;
                    no = fullContact!.phones.isNotEmpty
                        ? fullContact.phones.first.number
                        : '(none)';
                    print(fullContact!.name.first);
                    print(fullContact.phones.isNotEmpty
                        ? fullContact.phones.first.number
                        : '(none)');
                  });
                },
                items:
                    _contacts?.map<DropdownMenuItem<Contact>>((Contact value) {
                  return DropdownMenuItem<Contact>(
                      value: value,
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 30,
                          child: Text(
                            "${value.displayName}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.amberAccent),
                          )));
                }).toList(),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Expanded(
              child: Container(
                color: HexColor("28292C"),
                height: 50,
                child: Center(
                  child: CheersClubText(
                    text: no,
                    fontColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _contacts!.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
              title: Text(_contacts![i].displayName),
              onTap: () async {
                final fullContact =
                    await FlutterContacts.getContact(_contacts![i].id);
                //  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
              });
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    restourentCartCubit = RestourentCartCubit(RestourentKartrepositoryy());
    restourentCartCubit.loadProducts(widget.restorent_id.toString());

    print(cart!.length);
    _fetchContacts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: drowerAfterlogin(),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
          create: (context) => restourentCartCubit,
          child: BlocListener<RestourentCartCubit, RestourentCartState>(
            bloc: restourentCartCubit,
            listener: (context, state) {
              if (state is RestourentCartInitial) {}

              if (state is RestourentCartLoading) {
              } else if (state is RestourentCartSuccess) {
                cart = state.cart!;

                setState(() {
                  heght = 40 * cart!.length.toDouble();
                });
                sutotal = state.sutotal!;
                vat21 = state.vat21!;
                total = state.total!;
              } else if (state is RestourentCartdeletSuccess) {
                BlocProvider.of<RestourentCartCubit>(context)
                    .loadProducts(widget.restorent_id.toString());
              }
            },
            child: BlocBuilder<RestourentCartCubit, RestourentCartState>(
                builder: (context, state) {
              return cartForm();
            }),
          )),
    );
  }

  Widget cartForm() {
    List<Widget> _contatos = new List.generate(
        _count,
        (int i) => new contacts(
              b: _permissionDenied,
              contac: _contacts,
            ));

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2,
        color: HexColor("1A1B1D"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: Container(
                color: HexColor("131313"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13, top: 25),
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fitHeight,
                        height: 55,
                        //width: 220,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10, top: 40),
                            child: myAppBarIcon()),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _key.currentState!.openEndDrawer();
                            //Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20, top: 40),
                            child: Image.asset(
                              "assets/images/nav.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.amber, width: 2)),
                      margin: EdgeInsets.only(right: 0, top: 0),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.amber,
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const CheersClubText(
                      text: "MY KART",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CheersClubText(
                            text: "(Items)",
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )
                        ],
                      ),
                    )
                  ],
                )),

            //beginig of kart
            Container(
              color: HexColor("5D5D5E"),
              height: 40,
              margin: EdgeInsets.only(top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Discription",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Quantity",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),

            Container(
              height: heght,
              child: ListView.builder(
                  itemCount: cart!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      // color: HexColor("5D5D5E"),
                      height: 40,
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "name",
                            style: TextStyle(
                                color: HexColor("FFC853"),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${cart![index].quantity!}" +
                                cart![index].orderType!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            cart![index].price!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<RestourentCartCubit>(context)
                                  .deleteproduct(cart![index].id!.toString());
                            },
                            child: Icon(
                              Icons.delete_outline_rounded,
                              size: 16,
                              color: HexColor("FFC853"),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),

            Container(
//                  color: HexColor("5D5D5E"),
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Transacton fee",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    total!.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),

            Container(
//                  color: HexColor("5D5D5E"),
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sub Total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    sutotal!.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),

            Container(
//                  color: HexColor("5D5D5E"),
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "vat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    vat21!.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),

            Container(
              // color: HexColor("5D5D5E"),
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: 0, bottom: 0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: HexColor("FFC853"),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "2000",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CheersClubText(
                    text: "Whom to supprice",
                    fontColor: Colors.amber,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 220, top: 20),
              child: CheersClubText(
                text: "Reriptent name",
                fontColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: TextField(
                //controller: Password_Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  filled: true,
                  fillColor: HexColor("28292C"),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CheersClubText(
                    text: "Order type",
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 30, top: 0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    child: const CheersClubText(
                      text: "Instant",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Checkbox(
                    activeColor: HexColor("FEC753"),
                    side: BorderSide(color: Colors.amber),
                    checkColor: Colors.white,
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value_bussiness = false;
                        this.value = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    child: const CheersClubText(
                      text: "Scheduled",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Checkbox(
                    activeColor: HexColor("FEC753"),
                    side: BorderSide(color: Colors.amber),
                    checkColor: Colors.white,
                    value: this.value_bussiness,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = false;
                        this.value_bussiness = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: HexColor("28292C"),
              padding: EdgeInsets.only(left: 6, right: 6),
              margin: EdgeInsets.only(left: 20, right: 30, top: 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  focusColor: HexColor("28292C"),
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.black),
                  iconEnabledColor: Colors.amber,
                  items: <String>[
                    '91 india1',
                    '91 india2',
                    '91 india3 ',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "91 india",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 220, top: 20),
              child: CheersClubText(
                text: "Phone ",
                fontColor: Colors.white,
              ),
            ),
            /*
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: TextField(
                //controller: Password_Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  filled: true,
                  fillColor: HexColor("28292C"),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            */
            Container(
              child: Column(
                children: _contatos,
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: _addNewContactRow,
                    child: new Row(
                      children: [
                        new Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.white,
                        ),
                        CheersClubText(
                          text: "Add Another Phone Number",
                          fontColor: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 220, top: 20),
              child: CheersClubText(
                text: "Reciptant Message ",
                fontColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: TextField(
                //controller: Password_Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  filled: true,
                  fillColor: HexColor("28292C"),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 220, top: 20),
              child: CheersClubText(
                text: "Image/Videos ",
                fontColor: Colors.white,
              ),
            ),
            Container(
              height: 40,
              color: HexColor("28292C"),
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                    height: 20,
                    width: 100,
                    child: Center(
                      child: CheersClubText(
                        text: "Choose file",
                        fontColor: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 220, top: 20),
              child: CheersClubText(
                text: "Request to Restourent ",
                fontColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: TextField(
                //controller: Password_Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  filled: true,
                  fillColor: HexColor("28292C"),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 40,
              color: HexColor("FFC853"),
              margin:
                  EdgeInsets.only(left: 20, right: 220, top: 20, bottom: 30),
              child: Center(
                child: CheersClubText(
                  text: "Pay 199",
                  fontColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class contacts extends StatefulWidget {
  final bool? b;
  final List<Contact>? contac;
  const contacts({
    Key? key,
    this.b,
    this.contac,
  }) : super(key: key);

  @override
  _contactsState createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  List<Phone_no> _phone_list = [];
  List<Contact>? _contacts = [];
  int _count = 1;
  String no = "";
  Contact? contact_obj;
  //bool _permissionDenied = false;

  @override
  Widget build(BuildContext context) {
    return _body(widget.b!);
  }

  Widget _body(bool _permissionDenied) {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return Container(
        height: 46,
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
        padding: EdgeInsets.only(left: 4),
        //color: HexColor("FEC753"),
        child: Row(
          children: [
            Container(
              color: HexColor("28292C"),
              width: 120,
              child: DropdownButtonFormField<Contact>(
                isExpanded: true,
                decoration: InputDecoration(enabledBorder: InputBorder.none),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                hint: Text(
                  "Contacts",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                value: contact_obj,
                style: TextStyle(color: Colors.white),
                onChanged: (value) async {
                  final fullContact =
                      await FlutterContacts.getContact(value!.id);

                  setState(() {
                    contact_obj = value;
                    no = fullContact!.phones.isNotEmpty
                        ? fullContact.phones.first.number
                        : '(none)';
                    print(fullContact!.name.first);
                    print(fullContact.phones.isNotEmpty
                        ? fullContact.phones.first.number
                        : '(none)');
                  });
                },
                items: widget.contac
                    ?.map<DropdownMenuItem<Contact>>((Contact value) {
                  return DropdownMenuItem<Contact>(
                      value: value,
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 30,
                          child: Text(
                            "${value.displayName}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.amberAccent),
                          )));
                }).toList(),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Expanded(
              child: Container(
                color: HexColor("28292C"),
                height: 50,
                child: Center(
                  child: CheersClubText(
                    text: no,
                    fontColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

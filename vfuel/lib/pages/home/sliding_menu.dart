import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

typedef TitleCallback = void Function(int);

class DrawerMenu extends StatefulWidget {
  final TitleCallback? menuClickCallback;
  final Function? onHeaderClicled;
  const DrawerMenu({Key? key, this.menuClickCallback, this.onHeaderClicled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DrawerMenuState();
  }
}

class _DrawerMenuState extends State<DrawerMenu> {
  late Profile _userProfile;

  @override
  void initState() {
    super.initState();
    _userProfile = UserManager.instance.getCurrentUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Color(0xffF3F4F8),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    widget.onHeaderClicled!();
                  });
                },
                child: headCard(children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: ExactAssetImage(
                              'assets/images/profile_placeholder.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              vfuelText(
                                text: _userProfile.name,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                              vfuelText(
                                alignment: TextAlign.start,
                                text: _userProfile.email,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
            menuCard(children: [
              createDrawerBodyItem(
                  imageName: "assets/images/my_orders.png",
                  text: "My Orders",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(1);
                    });
                  }),
              divider(),
              createDrawerBodyItem(
                  imageName: "assets/images/my_locations.png",
                  text: "My Delivery Locations",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(2);
                    });
                  }),
              divider(),
              createDrawerBodyItem(
                  imageName: "assets/images/group_reports.png",
                  text: "My Reports",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(3);
                    });
                  }),
              divider(),
              createDrawerBodyItem(
                  imageName: "assets/images/user.png",
                  text: "My Profile",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(4);
                    });
                  }),
            ]),
            menuCard(children: [
              createDrawerBodyItem(
                  imageName: "assets/images/faq_icon.png",
                  text: "FAQ",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(5);
                    });
                  }),
              divider(),
              createDrawerBodyItem(
                  imageName: "assets/images/complaince.png",
                  text: "Complaint Registration",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(6);
                    });
                  }),
              divider(),
              createDrawerBodyItem(
                  imageName: "assets/images/contact_icon.png",
                  text: "Contact Us",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(7);
                    });
                  }),
            ]),
            menuCard(children: [
              createDrawerBodyItem(
                  imageName: "assets/images/logout_icon.png",
                  text: "Logout",
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.menuClickCallback!(8);
                    });
                  }),
            ]),
            // bottomCard(),
          ],
        ),
      ),
    );
  }
}

Widget createDrawerBodyItem(
    {required String imageName,
    required String text,
    GestureTapCallback? onTap}) {
  return ListTile(
    title: Container(
        child: Column(
      children: [
        Row(
          children: <Widget>[
            Image.asset(
              imageName,
              height: 20.0,
              width: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
      ],
    )),
    onTap: onTap,
  );
}

Widget headCard({
  required List<Widget> children,
}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22)),
      ),
      width: double.infinity,
      padding: EdgeInsets.only(left: 27, top: 32, bottom: 32, right: 5),
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: children,
      ));
}

Widget menuCard({
  required List<Widget> children,
}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: children,
      ));
}

Widget bottomCard({String? url}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(17),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'In partnership with',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xff024260),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Image.asset(
            'assets/images/green.jpeg',
            height: 31,
          )
        ],
      ));
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Divider(),
  );
}

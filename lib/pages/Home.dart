import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/pages/Profile.dart';
import 'package:hrm_app/pages/Request.dart';
import 'package:hrm_app/helper/DrawerWidget.dart';
import 'package:hrm_app/widget/HomeWidget/HomeMiddleWidget.dart';
import 'package:hrm_app/widget/HomeWidget/HomeTopWidget.dart';
import 'package:hrm_app/widget/HomeWidget/MeetingTab.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey_home = new GlobalKey<ScaffoldState>();

  int currentIndex = 1;
  SuperTooltip tooltip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onTap() {
    if (tooltip != null && tooltip.isOpen) {
      tooltip.close();
      return;
    }

    RenderBox renderBox = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();

    var targetGlobalCenter = renderBox
        .localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      outsideBackgroundColor: Colors.transparent,
      popupDirection: TooltipDirection.down,
      arrowTipDistance: 15.0,
      arrowBaseWidth: 20.0,
      arrowLength: 20.0,
      borderColor: Theme.of(context).buttonColor,
      borderWidth: 3.0,
      closeButtonSize: 20,
      snapsFarAwayVertically: false,
      showCloseButton: ShowCloseButton.inside,
      hasShadow: false,
      content: new Material(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          "Please press Long to get IN",
          style: GoogleFonts.poppins(),
          softWrap: true,
        ),
      )),
    );

    tooltip.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey_home,
      drawer: DrawerWidget(scaffoldKey: _scaffoldKey_home,),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            leading: new IconButton(
              icon: new Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => _scaffoldKey_home.currentState.openDrawer(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: <Widget>[
                  HomeMiddleWidget(), //TODO:: tabbar
                  HomeTopWidget(), //TODO:: username,absent-present status
                  Center(
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).buttonColor //TODO:: IN button
                          ),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .25),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).backgroundColor),
                        child: GestureDetector(
                          onTap: () {
                            onTap();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Center(
                              child: Text(
                                "IN",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

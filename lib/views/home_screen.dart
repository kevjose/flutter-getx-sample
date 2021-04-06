import 'package:facility_app/controllers/controllers.dart';
import 'package:facility_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthController> {
  static const routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("${controller.user.email}"),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Settings",
                style: kTitleStyle,
              ),
              trailing: Icon(
                Icons.settings,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Feedback",
                style: kTitleStyle,
              ),
              trailing: Icon(Icons.feedback),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Logout",
                style: kTitleStyle,
              ),
              trailing: Icon(Icons.power_settings_new),
              onTap: () {
                controller.signOutUser();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kSilver,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            top: 12.0,
            bottom: 12.0,
            right: 12.0,
          ),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: kBlack,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_outlined,
              color: kBlack,
              size: 30,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 18.0,
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.only(left: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Latest stats",
                    style: kTitleStyle,
                  ),
                ),
                SizedBox(height: 15.0),
                // Container(
                //   width: double.infinity,
                //   height: 180.0,
                //   child: ListView.builder(
                //     itemCount: facility.facilityStats.length,
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     physics: BouncingScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       var stat = facility.facilityStats[index];
                //       return CompanyCard2(stat: stat);
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: kBlack.withOpacity(.2),
                      ),
                    ),
                    // borderRadius: BorderRadius.circular(12.0),
                    child: TabBar(
                      unselectedLabelColor: kBlack,
                      indicator: BoxDecoration(
                        color: kBlack,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      tabs: [
                        Tab(text: "Recent Shifts"),
                        Tab(text: "Past Shifts"),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      )),
                      child: SizedBox(
                        height: 500.0,
                        child: TabBarView(
                          children: [
                            Center(
                              child: Text(
                                'TAB - 1',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'TAB - 2',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            // ListView.builder(
                            //   itemCount: facility.shifts.length,
                            //   scrollDirection: Axis.vertical,
                            //   shrinkWrap: true,
                            //   physics: ScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     var recent = facility.shifts[index];
                            //     return InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => JobDetail(
                            //               shift: recent,
                            //             ),
                            //           ),
                            //         );
                            //       },
                            //       child: RecentJobCard(shift: recent),
                            //     );
                            //   },
                            // ),
                            // ListView.builder(
                            //   itemCount: facility.shifts.length,
                            //   scrollDirection: Axis.vertical,
                            //   shrinkWrap: true,
                            //   physics: ScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     var recent = facility.shifts[index];
                            //     return InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => JobDetail(
                            //               shift: recent,
                            //             ),
                            //           ),
                            //         );
                            //       },
                            //       child: RecentJobCard(shift: recent),
                            //     );
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

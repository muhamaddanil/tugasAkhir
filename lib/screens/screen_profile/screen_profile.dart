import 'package:flutter/material.dart';
import 'package:MiniPonik/screens/screen_profile/widgets/widget_edit_setting_view.dart';

class ScreenProfile extends StatefulWidget {
  @override
  _ScreenProfileState createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  String username = "Username Test";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // ------------------------- SLIVER HEADER -------------------------//

            SliverAppBar(
              elevation: 0.0,
              expandedHeight: 100.0,
              floating: false,
              pinned: false,
              snap: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Tentang Aplikasi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "NotoSerif",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------------- SLIVER HEADER END -------------------------//
          ];
        },

        // ------------------------- BODY -------------------------//
        body: TabBarView(
          children: <Widget>[

            // ------------------------- EDIT SETTING VIEW CONTENT -------------------------//
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  EditSettingView(),
                ],
              ),
            ),
            // ------------------------- EDIT SETTING VIEW CONTENT END -------------------------//
          ],
        ),

        // ------------------------- BODY -------------------------//
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

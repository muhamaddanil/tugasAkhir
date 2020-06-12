import 'package:flutter/material.dart';
import 'package:MiniPonik/screens/screen_authentication/widgets/widget_login_view.dart';
import 'package:MiniPonik/screens/screen_authentication/widgets/widget_register_view.dart';

class ScreenAuth extends StatefulWidget {
  @override
  _ScreenAuthState createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  String username = "Username Test";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // ------------------------- SLIVER HEADER -------------------------//

                SliverAppBar(
                  elevation: 4.0,
                  expandedHeight: 175.0,
                  floating: false,
                  pinned: false,
                  snap: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: Center(
                        child: Icon(Icons.bookmark, size: 100.0),
                      ),
                    ),
                  ),
                ),
                // SliverPersistentHeader(
                //   pinned: false,
                //   delegate: _SliverAppBarDelegate(
                //     TabBar(
                //       labelColor: Colors.black87,
                //       unselectedLabelColor: Colors.grey,
                //       tabs: <Widget>[
                //         Tab(
                //           text: "Login",
                //         ),
                //         Tab(
                //           text: "Register",
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // ------------------------- SLIVER HEADER END -------------------------//
              ];
            },

            // ------------------------- BODY -------------------------//
            body:
                // TabBarView(
                // children: <Widget>[
                // ------------------------- EDIT LOGIN VIEW CONTENT -------------------------//
                Container(
              padding: EdgeInsets.all(4.0),
              child: ListView(
                children: <Widget>[
                  LoginView(),
                ],
              ),
            ),
            // ------------------------- EDIT LOGIN VIEW CONTENT END-------------------------//

            // ------------------------- EDIT REGISTER VIEW CONTENT -------------------------//
            // Container(
            //   padding: EdgeInsets.all(4.0),
            //   child: ListView(
            //     children: <Widget>[
            //       RegisterView(),
            //     ],
            //   ),
            // ),
            // ------------------------- EDIT REGISTER VIEW CONTENT END -------------------------//
            // ],
            // ),

            // ------------------------- BODY -------------------------//
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

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
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

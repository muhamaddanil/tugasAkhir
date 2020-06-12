import 'package:MiniPonik/screens/screen_archive/screen_test.dart';
import 'package:MiniPonik/screens/screen_archive/screen_web_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:video_player/video_player.dart';

class ScreenArchive extends StatefulWidget {
  @override
  _ScreenArchiveState createState() => _ScreenArchiveState();
}

class _ScreenArchiveState extends State<ScreenArchive> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // ------------------------- SLIVER HEADER -------------------------//

                SliverAppBar(
                  elevation: 0.0,
                  expandedHeight: 100.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Container(
                      padding: EdgeInsets.all(18.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Arcive File",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "NotoSerif",
                                fontWeight: FontWeight.bold,
                                fontSize: 27.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },

            // ------------------------- SLIVER HEADER END-------------------------//

            // ------------------------- BODY -------------------------//

            body: ListView(
              children: <Widget>[
                _ExampleCard(title: "29 Januari 2020"),
                _ExampleCard(title: "02 Februari 2020"),
                _ExampleCard(title: "22 Februari 2020"),
                Card(
                    child: Column(children: <Widget>[
                  Column(
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.cake),
                        title: Text("Video 25 Februari 2020"),
                      ),
                      Stack(
                          alignment: FractionalOffset.bottomRight +
                              const FractionalOffset(-0.1, -0.1),
                          children: <Widget>[
                            _ButterFlyAssetVideo(),
                            Image.asset('assets/flutter-mark-square-64.png'),
                          ]),
                    ],
                  ),
                ])),
              ],
            ))

        // ------------------------- BODY END -------------------------//

        );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 100.0;
  @override
  double get maxExtent => 100.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.airline_seat_flat_angled),
            title: Text(title),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Nonton'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenWeb()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButterFlyAssetVideo extends StatefulWidget {
  @override
  _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}

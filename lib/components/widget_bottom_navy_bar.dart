import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavyBarX extends StatefulWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItemX> items;
  final ValueChanged<int> onItemSelected;

  BottomNavyBarX(
      {Key key,
      this.selectedIndex = 0,
      this.showElevation = true,
      this.iconSize = 24,
      this.backgroundColor,
      this.animationDuration = const Duration(milliseconds: 270),
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(items.length >= 1 && items.length <= 6);
    assert(onItemSelected != null);
  }

  @override
  _BottomNavyBarXState createState() => _BottomNavyBarXState();
}

class _BottomNavyBarXState extends State<BottomNavyBarX> {
  Widget _buildItem(BottomNavyBarItemX item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 130 : 50,
      height: double.maxFinite,
      duration: widget.animationDuration,
      padding: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? item.activeColor.withOpacity(0.8)
            : widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: widget.iconSize,
                      color: isSelected
                          ? Color(0xffEAEBEC)
                          : item.inactiveColor == null
                              ? item.activeColor
                              : item.inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          color: Color(0xffEAEBEC),
                          fontWeight: FontWeight.bold),
                      child: item.title,
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (widget.backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : widget.backgroundColor;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
          color: bgColor,
          boxShadow: [
            if (widget.showElevation)
              BoxShadow(color: Colors.black12, blurRadius: 2)
          ]),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onItemSelected(index);
                  });
                },
                child: _buildItem(item, widget.selectedIndex == index),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItemX {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final archivee;

  BottomNavyBarItemX(
      {@required this.icon,
      @required this.title,
      this.activeColor = Colors.blue,
      this.inactiveColor,
      this.archivee}) {
    assert(icon != null);
    assert(title != null);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);
  final ScrollController controller;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  String _fakeText =
      "Selamlar. Flutter ile olan serimize devam ediyoruz. Bu serimizde Twitter Clone uygulamamızın ilkini geliştiriyoruz.";
  String _userImage =
      "https://images.unsplash.com/photo-1555445091-5a8b655e8a4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80";
  bool isHeaderClose = false;
  double lastOffset = 0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: _listView,
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.adb),
      );





  Widget get _listView => ListView.builder(
      itemCount: 10,
      controller: widget.controller,
      itemBuilder: (context, index) {
        return _listViewCard;
      });

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_userImage),
          ),
          title: Wrap(
            runSpacing: 5,
            spacing: 10,
            children: <Widget>[
              _listCardTitle("hello"),
              Text(_fakeText),
              _placeHolderField,
              _footerButtomRow
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        height: 100,
        child: Placeholder(),
      );

  Widget get _footerButtomRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w800);

import 'package:flutter/material.dart';
import 'package:twitter_clone/home/home_view.dart';
import 'package:twitter_clone/home/search_view.dart';

class TwitterTabbarView extends StatefulWidget {
  @override
  _TwitterTabbarViewState createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  bool isHeaderClose = false;
  String _imageUrl =
      "https://static.karar.com/img/682x350/19-07/18/bilgisayar-muhendisligi.jpg";

  double lastOffset = 0;
  int currentIndex = 0;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: <Widget>[
            _containerAppBar,
           _tabbarViews,
          ],
        ),
      ),
    );
  }

  Widget get _sizedBox => SizedBox(
        width: 20,
      );

  Widget get _tabbarViews => Expanded(
        child: TabBarView(
          children: <Widget>[
            HomeView(scrollController),
            SearchView(scrollController),
            Text("asdasd"),
            Text("asdasd"),
          ],
        ),
      );

  Widget get _bottomAppBar => BottomAppBar(
        child: _tabbarItems,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );
  Widget get _appBarItems => Wrap(
    
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        spacing: 20,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(_imageUrl),
          ),
          // _sizedBox,
          _centerAppBarWidget
        ],
      );

  Widget get _centerAppBarWidget => currentIndex == 1
      ? _textField
      : Text(
          "Home",
          style: titleTextStyle,
        );

  Widget get _textField => Container(
    width: MediaQuery.of(context).size.width-200,
      child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            hintText: "Search for twitter",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
  );

  Widget get _containerAppBar => AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isHeaderClose ? 0 : 100,
      child: _appBar);

  Widget get _tabbarItems => TabBar(
        isScrollable: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.dashboard),
          ),
          Tab(
            icon: Icon(Icons.dashboard),
          )
        ],
      );
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w800);

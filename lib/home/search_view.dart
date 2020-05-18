import 'package:flutter/material.dart';
import 'package:twitter_clone/models/trend_topic.dart';

class SearchView extends StatefulWidget {
  SearchView(this.scrollController);
  final ScrollController scrollController;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TrendTopic _topic;
  double _padding = 20;
  @override
  void initState() {
    super.initState();
    _topic=TrendTopic(hashtag: "#Corona",location: "Trending in Turkey",tweets: "123.3K Tweets");
  }
  Future tempFuture() async {
    print("refresh den önce");
    await Future.delayed(Duration(milliseconds: 500));
    print("refresh den sonra");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}),
          body: RefreshIndicator(
        onRefresh: tempFuture,
            child: ListView(
          children: <Widget>[
            _downIconWidget,
            _emptySize,
            _trendTitleWidget,
            _listHashWidget,
          
          ],
        ),
      ),
    );
  }

  Widget get _emptySize => SizedBox(
        height: 10,
      );

  Widget get _downIconWidget => Container(
    height: 60,
          child: Icon(
        Icons.arrow_downward,
        color: Colors.grey,
      ));

  Widget get _trendTitleWidget => Card(
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Colors.grey, width: 0.5)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          height: 50,
          child: Text(
            "Trends for you",
            style: Theme.of(context).textTheme.headline,
          ),
          alignment: Alignment.centerLeft,
        ),
      );

      Widget get _listHashWidget =>   ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>Card(
              margin: EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(side: BorderSide(style: BorderStyle.none)),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: _padding,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child:
                     Wrap(
                       crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: <Widget>[
                        Text(_topic.location,style: Theme.of(context).textTheme.caption,),
                        Text(_topic.hashtag,style: Theme.of(context).textTheme.headline.copyWith(fontSize: 15),),
                        Text(_topic.tweets,style: Theme.of(context).textTheme.button)
                      ],
                    ),),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(height: 0,color: Colors.grey,),
            itemCount: 5);
}

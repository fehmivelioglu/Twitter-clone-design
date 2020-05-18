class TrendTopic {
  String tweets;
  String hashtag;
  String location;

  TrendTopic({this.tweets, this.hashtag, this.location});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    tweets = json['tweets'];
    hashtag = json['hashtag'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tweets'] = this.tweets;
    data['hashtag'] = this.hashtag;
    data['location'] = this.location;
    return data;
  }
}
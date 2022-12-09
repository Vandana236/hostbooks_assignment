class SearchedUserReponse {
  SearchedUserReponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });
  late final int totalCount;
  late final bool incompleteResults;
  late final List<User> items;
  
  SearchedUserReponse.fromJson(Map<String, dynamic> json){
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    items = List.from(json['items']).map((e)=>User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['incomplete_results'] = incompleteResults;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    required this.score,
  });
  late final String login;
  late final int id;
  late final String nodeId;
  late final String avatarUrl;
  late final String gravatarId;
  late final String url;
  late final String htmlUrl;
  late final String followersUrl;
  late final String followingUrl;
  late final String gistsUrl;
  late final String starredUrl;
  late final String subscriptionsUrl;
  late final String organizationsUrl;
  late final String reposUrl;
  late final String eventsUrl;
  late final String receivedEventsUrl;
  late final String type;
  late final bool siteAdmin;
  late final String score;
  
  User.fromJson(Map<String, dynamic> json){
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    score = json['score'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['avatar_url'] = avatarUrl;
    _data['gravatar_id'] = gravatarId;
    _data['url'] = url;
    _data['html_url'] = htmlUrl;
    _data['followers_url'] = followersUrl;
    _data['following_url'] = followingUrl;
    _data['gists_url'] = gistsUrl;
    _data['starred_url'] = starredUrl;
    _data['subscriptions_url'] = subscriptionsUrl;
    _data['organizations_url'] = organizationsUrl;
    _data['repos_url'] = reposUrl;
    _data['events_url'] = eventsUrl;
    _data['received_events_url'] = receivedEventsUrl;
    _data['type'] = type;
    _data['site_admin'] = siteAdmin;
    _data['score'] = score;
    return _data;
  }
}
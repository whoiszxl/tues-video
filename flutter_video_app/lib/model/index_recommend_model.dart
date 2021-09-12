class IndexRecommendModel {
  List<Records> records;
  int total;
  int size;
  int current;
  int pages;

  IndexRecommendModel(
      {this.records, this.total, this.size, this.current, this.pages});

  IndexRecommendModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = [];
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['size'] = this.size;
    data['current'] = this.current;
    data['pages'] = this.pages;
    return data;
  }
}

class Records {
  int id;
  int memberId;
  String memberNickname;
  String memberAvatar;
  String videoText;
  String videoCover;
  String videoUrl;
  int videoSeconds;
  int videoWidth;
  int videoHeight;
  int watchCount;
  int likeCount;
  int commentCount;
  String channel;
  String address;
  String ip;
  int status;
  String createdAt;
  String updatedAt;

  Records(
      {this.id,
        this.memberId,
        this.memberNickname,
        this.memberAvatar,
        this.videoText,
        this.videoCover,
        this.videoUrl,
        this.videoSeconds,
        this.videoWidth,
        this.videoHeight,
        this.watchCount,
        this.likeCount,
        this.commentCount,
        this.channel,
        this.address,
        this.ip,
        this.status,
        this.createdAt,
        this.updatedAt});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    memberNickname = json['memberNickname'];
    memberAvatar = json['memberAvatar'];
    videoText = json['videoText'];
    videoCover = json['videoCover'];
    videoUrl = json['videoUrl'];
    videoSeconds = json['videoSeconds'];
    videoWidth = json['videoWidth'];
    videoHeight = json['videoHeight'];
    watchCount = json['watchCount'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    channel = json['channel'];
    address = json['address'];
    ip = json['ip'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['memberId'] = this.memberId;
    data['memberNickname'] = this.memberNickname;
    data['memberAvatar'] = this.memberAvatar;
    data['videoText'] = this.videoText;
    data['videoCover'] = this.videoCover;
    data['videoUrl'] = this.videoUrl;
    data['videoSeconds'] = this.videoSeconds;
    data['videoWidth'] = this.videoWidth;
    data['videoHeight'] = this.videoHeight;
    data['watchCount'] = this.watchCount;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['channel'] = this.channel;
    data['address'] = this.address;
    data['ip'] = this.ip;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class BookMark {
  String title;
  String text;
  String imageUrl;
  String content;

  BookMark(this.title, this.text, this.imageUrl, this.content);

  BookMark.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['description'];
    imageUrl = json['urlToImage'];
    content = json['content'];
  }
}

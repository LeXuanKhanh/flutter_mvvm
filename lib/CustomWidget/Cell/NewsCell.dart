import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/Data/NewsData/NewsData.dart';

class NewsCell extends StatelessWidget {

  final NewDataArticle data;

  NewsCell({this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text('Title ${data.author}'),
      leading: CircleAvatar(
        child: Text(data.title),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
    );
  }
}
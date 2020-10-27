import 'package:flutter/material.dart';

class Work {
  String title;
  String description;
  String category;
  List<String> technologies;
  String thumbnailUrl;
  List<String> galleryUrl;
  String projectRepoUrl;

  Work({
    @required this.title,
    this.description,
    @required this.category,
    this.technologies,
    @required this.galleryUrl,
    @required this.thumbnailUrl,
    this.projectRepoUrl
  });
}
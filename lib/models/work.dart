import 'package:flutter/material.dart';

class Work {
  String title;
  String description;
  String longDescription;
  List<String> category;
  List<String> technologies;
  String cardThumbnailUrl;
  Alignment cardThumbnailAlignment;
  String projectIconUrl;
  List<String> galleryUrl;
  String projectRepoUrl;
  Color projectColor;

  Work({
    @required this.title,
    @required this.description,
    this.longDescription,
    @required this.category,
    this.technologies,
    @required this.projectIconUrl,
    @required this.cardThumbnailUrl,
    this.cardThumbnailAlignment,
    this.galleryUrl,
    this.projectRepoUrl,
    this.projectColor
  });
}
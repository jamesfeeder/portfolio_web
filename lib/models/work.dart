import 'package:flutter/material.dart';

class Work {
  String title;
  String description;
  String longDescription;
  List<String> category;
  List<String> technology;
  String cardThumbnailUrl;
  Alignment cardThumbnailAlignment;
  String projectIconUrl;
  List<String> galleryUrl;
  String projectRepoUrl;
  Color projectColor;
  Color projectSecondaryColor;

  Work({
    @required this.title,
    @required this.description,
    this.longDescription,
    @required this.category,
    @required this.technology,
    @required this.projectIconUrl,
    @required this.cardThumbnailUrl,
    this.cardThumbnailAlignment,
    this.galleryUrl,
    this.projectRepoUrl,
    this.projectColor,
    this.projectSecondaryColor
  });
}
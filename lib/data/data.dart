import 'package:flutter/material.dart';
import 'package:portfolio/models/work.dart';

class PortfolioData {
  static List<Work> workList = [
  //NOTE: Quicknote Data 
    Work(
      title: "Quicknote!",
      category: [
        "Mobile",
        "PWA"
      ],
      description: "An application for Taking Note, Cloud Save and Markdown Text Styling Support.",
      //longDescription: "",
      technology: [
        "Flutter",
        "Flutter Web",
        "Cloud Firestore"
      ],
      projectRepoUrl: "https://github.com/jamesfeeder/quicknote_private",
      projectColor: Colors.amber[100],
      projectIconUrl: "assets/quicknote/00.png",
      cardThumbnailUrl: "assets/quicknote/02.jpg",
      cardThumbnailAlignment: Alignment.topCenter,
      galleryUrl: [
        "assets/quicknote/01.jpg",
        "assets/quicknote/02.jpg",
        "assets/quicknote/03.jpg",
        "assets/quicknote/04.jpg",
      ],
    ),
  ];
}

class CategoryData {
  static Map<String,String> categoryList = {
    "Mobile":"Mobile Application",
    "PWA":"Progressive Web Application"
  };
}
import 'package:flutter/material.dart';
import 'package:portfolio/models/work.dart';

class PortfolioData {
  static List<Work> workList = [
  //NOTE: Quicknote Data 
    Work(
      title: "Quicknote",
      category: [
        "Mobile",
        "PWAs"
      ],
      description: "An application for Taking Note. Cloud Save and Markdown Text Styling Support.",
      //longDescription: "",
      technologies: ["Flutter", "Flutter Web", "Firebase"],
      projectRepoUrl: "https://github.com/jamesfeeder/quicknote_private",
      projectColor: Colors.amber,
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
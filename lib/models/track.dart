import 'package:flutter/material.dart';

class TrackItem {
  final String id;
  final String title;
  final String author;
  final List<String> category;
  final String trackURL;
  final String coverURL;

  TrackItem({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.trackURL,
    required this.coverURL,
  });
}

class Track with ChangeNotifier {
  static final List _tracks = [
    TrackItem(
      id: '1',
      title: 'Tropical Soul',
      author: 'Luke Bergs',
      category: ['Guitar', 'Happy'],
      trackURL:
          'https://www.chosic.com/wp-content/uploads/2022/03/Luke-Bergs-Tropical-Soulmp3.mp3',
      coverURL:
          'https://www.chosic.com/wp-content/uploads/FreeMusicTagsImages/60/Tropical.jpg',
    ),
    
  ];

  final List _categories = [
    'Guitar',
    'Happy',
    'Piano',
    'Motivational',
    'Relaxation',
    'Sad',
  ];

  List get tracks {
    return _tracks;
  }

  List get categories {
    return _categories;
  }
}

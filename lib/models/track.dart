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

class Track with ChangeNotifier{
  static final List _tracks = [
    TrackItem(
      id: '1',
      title: 'Raising Me Higher',
      author: 'Ahjay Stelino',
      category: ['guitar', 'happy'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-raising-me-higher-34.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '2',
      title: 'Dreaming Big',
      author: 'Ahjay Stelino',
      category: ['piano', 'motivational'],
      trackURL:
          'src="https://assets.mixkit.co/music/preview/mixkit-dreaming-big-31.mp3"',
      coverURL: '',
    ),
    TrackItem(
      id: '3',
      title: 'Beautiful Dream',
      author: 'Diego Nava',
      category: ['relaxation', 'guitar'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-beautiful-dream-493.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '4',
      title: 'Spirit in the Woods',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-spirit-in-the-woods-139.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '5',
      title: 'Forest Treasure',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-forest-treasure-138.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '6',
      title: 'Delightful',
      author: 'Ahjay Stelino',
      category: ['guitar'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '7',
      title: 'Night Sky',
      author: 'Michael Ramir C.',
      category: ['motivational'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-night-sky-hip-hop-970.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '8',
      title: 'Silent Descent',
      author: 'Eugenio Mininni',
      category: ['piano', 'sad'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-silent-descent-614.mp3',
      coverURL: '',
    ),
    TrackItem(
      id: '9',
      title: 'Sunset',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-playground-fun-12.mp3',
      coverURL: '',
    ),
  ];

  List get tracks {
    return _tracks;
  }
}

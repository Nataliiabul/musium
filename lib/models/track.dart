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
      coverURL: 'https://witches-empire.com/upload/iblock/491/49133b9790b4281816b7c381102d2c39.jpg',
    ),
    TrackItem(
      id: '2',
      title: 'Dreaming Big',
      author: 'Ahjay Stelino',
      category: ['piano', 'motivational'],
      trackURL:
          'src="https://assets.mixkit.co/music/preview/mixkit-dreaming-big-31.mp3"',
      coverURL: 'https://i.pinimg.com/236x/dd/55/4c/dd554c4bda263cec85ce35eb92ab91e7--moon-images-black-girls.jpg',
    ),
    TrackItem(
      id: '3',
      title: 'Beautiful Dream',
      author: 'Diego Nava',
      category: ['relaxation', 'guitar'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-beautiful-dream-493.mp3',
      coverURL: 'https://ic.pics.livejournal.com/marfa_nikitina4/68386950/1374037/1374037_600.jpg',
    ),
    TrackItem(
      id: '4',
      title: 'Spirit in the Woods',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-spirit-in-the-woods-139.mp3',
      coverURL: 'https://artlords-artwork.s3.amazonaws.com/uploads/image/10935/thumb_jumbo_sylvebehance.jpg',
    ),
    TrackItem(
      id: '5',
      title: 'Forest Treasure',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-forest-treasure-138.mp3',
      coverURL: 'https://thumbnailer.mixcloud.com/unsafe/600x600/extaudio/0/5/4/5/43b6-3cb1-4bff-9481-3dc378a9e225',
    ),
    TrackItem(
      id: '6',
      title: 'Delightful',
      author: 'Ahjay Stelino',
      category: ['guitar'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3',
      coverURL: 'https://images.wallpapersden.com/image/download/sea-shore-minimalism_ZmpubmuUmZqaraWkpJRnbmhnrWduaGc.jpg',
    ),
    TrackItem(
      id: '7',
      title: 'Night Sky',
      author: 'Michael Ramir C.',
      category: ['motivational'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-night-sky-hip-hop-970.mp3',
      coverURL: 'https://avatars.yandex.net/get-music-content/2359742/c2f02840.a.11605218-1/m1000x1000?webp=false',
    ),
    TrackItem(
      id: '8',
      title: 'Silent Descent',
      author: 'Eugenio Mininni',
      category: ['piano', 'sad'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-silent-descent-614.mp3',
      coverURL: 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/64b06754145657.5609313ddf2a9.jpg',
    ),
    TrackItem(
      id: '9',
      title: 'Sunset',
      author: 'Alejandro Magaña',
      category: ['relaxation'],
      trackURL:
          'https://assets.mixkit.co/music/preview/mixkit-playground-fun-12.mp3',
      coverURL: 'https://image.winudf.com/v2/image/aW5mby5rb3NpdC5zdW5zZXQyX3NjcmVlbl80XzE1MTMzOTI1MDNfMDcy/screen-4.jpg?fakeurl=1&type=.jpg',
    ),
  ];

  List get tracks {
    return _tracks;
  }
}

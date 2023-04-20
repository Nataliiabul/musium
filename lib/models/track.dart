import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TrackItem {
  final String id;
  final String title;
  final String author;
  final String category;
  final String trackURL;
  final String coverURL;
  bool isFavorite;

  TrackItem({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.trackURL,
    required this.coverURL,
    this.isFavorite = false,
  });
}

class Track with ChangeNotifier {
  static List<TrackItem> _tracks = [
    // TrackItem(
    //   id: '1',
    //   title: 'Tropical Soul',
    //   author: 'Luke Bergs',
    //   category: 'Happy',
    //   trackURL:
    //       'https://www.chosic.com/wp-content/uploads/2022/03/Luke-Bergs-Tropical-Soulmp3.mp3',
    //   coverURL:
    //       'https://sun6-22.userapi.com/s/v1/if2/Hbo7vc6OUbrhFLJbaHCe4cXZM_YiSflSgg0eARW7JQvsJQTdq6NZXSh6z1LjiSC2DoFC9Qa09yemvWiTxAe56qdu.jpg?size=1313x1313&quality=96&crop=0,79,1313,1313&ava=1',
    // ),
    // TrackItem(
    //   id: '2',
    //   title: 'Sundown',
    //   author: 'Balynt',
    //   category: 'Happy',
    //   trackURL:
    //       'https://www.chosic.com/wp-content/uploads/2023/03/Balynt-Sundown.mp3',
    //   coverURL:
    //       'https://images.wallpaperscraft.com/image/single/sunset_sea_sun_131600_3415x3415.jpg',
    // ),
    // TrackItem(
    //   id: '3',
    //   title: 'Silent Wood',
    //   author: 'Purrple Cat',
    //   category: 'Calm',
    //   trackURL:
    //       'https://www.chosic.com/wp-content/uploads/2022/01/silent-wood.mp3',
    //   coverURL:
    //       'https://sun9-55.userapi.com/impf/c840528/v840528539/5b9cd/NfB_25IaXno.jpg?size=600x600&quality=96&sign=f96cda1b8c6af45600aaf25b601dffcc&c_uniq_tag=Q3di-NTAziU9TdOecrUt9Gu2t76aULOc1H9WaTHDIZY&type=album',
    // ),
    // TrackItem(
    //   id: '4',
    //   title: 'Music to Delight',
    //   author: 'Kevin MacLeod',
    //   category: 'Funny',
    //   trackURL:
    //       'https://www.chosic.com/wp-content/uploads/2022/07/Music-to-Delight.mp3',
    //   coverURL:
    //       'https://wallbox.ru/resize/1024x1024/wallpapers/main2/201901/cvety-gory-sneg.jpg',
    // ),
    // TrackItem(
    //   id: '5',
    //   title: 'Undertow',
    //   author: 'Scott Buckley',
    //   category: 'Sad',
    //   trackURL:
    //       'https://www.chosic.com/wp-content/uploads/2021/08/scott-buckley-undertow.mp3',
    //   coverURL:
    //       'https://avatars.yandex.net/get-music-content/5417945/4b484f32.a.21528364-1/m1000x1000?webp=false',
    // ),
    // TrackItem(
    //   id: '6',
    //   title: 'Nature',
    //   author: 'Sound Effects',
    //   category: 'Nature',
    //   trackURL: 'https://www.chosic.com/wp-content/uploads/2021/07/Rain.mp3',
    //   coverURL:
    //       'https://i01.fotocdn.net/s121/db85e01969a3c587/public_pin_l/2756637504.jpg',
    // ),
  ];

  bool setFirstData = false;

  List categories(List tracks) {
    List categories = [];
    for (TrackItem track in tracks) {
      if (!categories.contains(track.category)) {
        categories.add(track.category);
      }
    }
    return categories;
  }

  List get tracks {
    return _tracks;
  }

  List<TrackItem> get favoriteTracks {
    return _tracks.where((track) => track.isFavorite).toList();
  }

  Future<void> toggleFavoriteStatus(String userId, TrackItem tracksItem) async {
    // final oldStatus = isFavorite;
    tracksItem.isFavorite = !tracksItem.isFavorite;
    notifyListeners();
    final url = Uri.parse(
        '${dotenv.env['REALTIMEDATABASE']}users/$userId/favorites/${tracksItem.id}.json');
    try {
      final response = await http.put(
        url,
        body: json.encode(tracksItem.isFavorite),
      );
      // if (response.statusCode >= 400) {
      //   _setFavoriteValue(oldStatus);}
    } catch (error) {
      // _setFavoriteValue(oldStatus);
    }
  }

  List categoriesTracks(String category) {
    return _tracks
        .where((trackItem) => trackItem.category == category)
        .toList();
  }

  List findTracksArtists(String text) {
    return _tracks
        .where((trackItem) =>
            trackItem.title.toLowerCase().contains(text.toLowerCase()) ||
            trackItem.author.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  Future<void> fetchAndSetTracks(String userId) async {
    var url = Uri.parse('${dotenv.env['REALTIMEDATABASE']}tracks.json');
    try {
      var response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      url = Uri.parse(
          '${dotenv.env['REALTIMEDATABASE']}users/$userId/favorites.json');
      response = await http.get(url);
      final favoritesData = json.decode(response.body);
      final List<TrackItem> loadedTracks = [];
      extractedData.forEach(
        (trackId, trackItem) {
          loadedTracks.add(
            TrackItem(
              id: trackItem['id'],
              title: trackItem['title'],
              author: trackItem['author'],
              category: trackItem['category'],
              trackURL: trackItem['trackURL'],
              coverURL: trackItem['coverURL'],
              isFavorite:
                  favoritesData == null ? false : favoritesData[trackId] ?? false,
            ),
          );
        },
      );
      _tracks = loadedTracks;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}

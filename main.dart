import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrity Albums',
      home: CelebrityAlbumsPage(),
    );
  }
}

class CelebrityAlbumsPage extends StatelessWidget {
  final List<Album> albums = [
    Album(
      title: 'Christopher Hemsworth',
      description: 'Christopher Hemsworth - Actor film producer',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Chris_Hemsworth_by_Gage_Skidmore_3.jpg/800px-Chris_Hemsworth_by_Gage_Skidmore_3.jpg', // Thay bằng URL ảnh thực tế
      photos: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Chris_Hemsworth_by_Gage_Skidmore.jpg/800px-Chris_Hemsworth_by_Gage_Skidmore.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Chris_Hemsworth_%288492541282%29.jpg/800px-Chris_Hemsworth_%288492541282%29.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/800px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
      ],
    ),
    Album(
      title: 'Cristiano Ronaldo',
      description: 'Cristiano Ronaldo - football player',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg', // Thay bằng URL ảnh thực tế
      photos: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/800px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/0/00/Ronaldo_-_Manchester_United_vs_Chelsea.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cristiano_Ronaldo.jpg/1280px-Cristiano_Ronaldo.jpg',
      ],
    ),
    Album(
      title: 'Xuân Bắc',
      description: 'Xuân Bắc - diễn viên, nghệ sĩ hài',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/XuanBac_2019_%28cropped%29.jpg/800px-XuanBac_2019_%28cropped%29.jpg', // Thay bằng URL ảnh thực tế
      photos: [
        'https://images2.thanhnien.vn/Uploaded/kieutrinh/2023_01_27/xb-ailatrieuphu-3716.jpg',
        'https://images2.thanhnien.vn/Uploaded/kieutrinh/2023_01_27/xuanbac2-1802.jpg',
        'https://danviet.mediacdn.vn/upload/4-2015/images/2015-11-01/1446340996-xuan-bac-1.jpg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Celebrity Albums'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return Card(
            margin: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumDetailPage(album: album),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network(
                    album.imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 200,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          album.title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          album.description,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  final Album album;

  AlbumDetailPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang album
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: album.photos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              album.photos[index],
              fit: BoxFit.fitHeight,
            ),
          );
        },
      ),
    );
  }
}

class Album {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> photos;


  Album({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.photos,
  });
}
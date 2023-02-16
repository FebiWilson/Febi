import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
       body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  offset: Offset(2, 2),
                                  blurRadius: 10.0),
                            ],
                          ),
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                    children: [SizedBox(
                      width: MediaQuery.of(context).size.width*0.79,
                    ),
                       IconButton(
                                         alignment: Alignment.topRight,
                                         color: Colors.grey,
                                         onPressed: () {Get.to(()=>HomeView());},
                                         icon: Icon(
                        FontAwesomeIcons.ellipsis,
                        size: 30,
                                         )),
                     ],
                  ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                              
              child: Column(
                children: [
                  Text(photos[index].title),
                  Image.network(photos[index].thumbnailUrl, width: 300,height: 300,fit: BoxFit.cover,),
                ],
              ),
            ),
                            ],
                          ),
            ),
            SizedBox(
              height: 20,

            ),
          ],
        );
      },
    );
  }
}
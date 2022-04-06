import 'package:flutter/material.dart';
import 'package:mountain_app/model/mountain.dart';
import 'package:mountain_app/widget/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailActivity extends StatelessWidget {
  final Mountain mountain;
  const DetailActivity({Key? key, required this.mountain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                LikeButton(mountain: mountain),
              ],
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                final scaleOfTitle = (constraints.biggest.height - 324) / -244;
                return FlexibleSpaceBar(
                  //expandedTitleScale: 1,
                  titlePadding: EdgeInsets.only(
                    left: 24 + 48 * scaleOfTitle,
                    bottom: 16 + 0.5 * scaleOfTitle,
                    //left: 72,
                    //bottom: 16.5,
                  ),
                  title: Text(mountain.title),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        mountain.imagePath,
                        fit: BoxFit.cover,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 32,
              left: 12,
              right: 16,
              top: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(mountain.location)
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text(
                    mountain.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchMap();
                  },
                  child: const Text("Search on Google Maps"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchMap() async {
    final query = Uri.encodeComponent(mountain.title);
    final googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}

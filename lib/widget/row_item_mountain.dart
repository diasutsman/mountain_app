import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain_app/model/mountain.dart';
import 'package:mountain_app/screen/activity_detail.dart';

class RowItemMountain extends StatelessWidget {
  final Mountain mountain;
  const RowItemMountain({Key? key, required this.mountain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Fluttertoast.showToast(
          msg: mountain.isLike ? "I like this" : "I don't like this",
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailActivity(mountain: mountain),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              mountain.imagePath,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(
                      mountain.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(
                      mountain.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      // text for testing
                      //Text("test"),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(mountain.location)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

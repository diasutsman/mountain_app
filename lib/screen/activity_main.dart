import 'package:flutter/material.dart';
import 'package:mountain_app/data/mountains_data.dart';
import 'package:mountain_app/widget/row_item_mountain.dart';

class MainActivity extends StatelessWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mountain App"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RowItemMountain(mountain: MountainsData.listData[index]);
        },
        itemCount: MountainsData.listData.length,
      ),
    );
  }
}

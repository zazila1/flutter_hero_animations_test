import 'package:flutter/material.dart';
import 'package:hero_card/model/space.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({Key? key, required this.data}) : super(key: key);

  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: '${data.id}-image',
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
            Hero(
              tag: '${data.id}-add-button',
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    height: 40,
                    width: double.infinity,
                    color: Colors.yellow[700],
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
            Hero(
              tag: '${data.id}-title',
              child: Material(
                child: Text(data.description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
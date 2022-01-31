import 'package:flutter/material.dart';
import 'package:hero_card/repository/space_repository.dart';

import 'detailed_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final spaces = ConstSpacesRepository().loadSpeakers();

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 280;
    const double cardVerticalMargin = 8;
    const double cardHorizontalMargin = 8;
    const int topFlexRatio = 2;
    const int botFlexRatio = 1;
    const double addButtonSize = 40;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: cardHeight,
              color: Colors.grey[300],
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                elevation: 4,
                margin: const EdgeInsets.symmetric(
                    vertical: cardVerticalMargin, horizontal: cardHorizontalMargin),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailedView(data: spaces[index])));
                  },
                  child: Stack(children: [
                    Column(
                      children: [
                        Expanded(
                          flex: topFlexRatio,
                          child: SizedBox(
                            width: double.infinity,
                            child: Hero(
                              tag: '${spaces[index].id}-image',
                              child: Image.asset(
                                spaces[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: botFlexRatio,
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                            child: Center(
                              child: Hero(
                                tag: '${spaces[index].id}-title',
                                child: Material(
                                  child: Text(
                                    spaces[index].description,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 30,
                      top: (cardHeight - cardVerticalMargin * 2) *
                          topFlexRatio /
                          (topFlexRatio + botFlexRatio) -
                          addButtonSize / 2,
                      child: Hero(
                        tag: '${spaces[index].id}-add-button',
                        child: Material(
                          child: Container(
                            height: addButtonSize,
                            width: addButtonSize,
                            color: Colors.yellow[700],
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ));
        },
      ),
    );
  }
}
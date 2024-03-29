import 'package:flutter/material.dart';

class NewsDetailsEn extends StatefulWidget {
  NewsDetailsEn(this.newsitem);
  dynamic newsitem;
  @override
  State<NewsDetailsEn> createState() => _NewsDetailsState(newsitem);
}

class _NewsDetailsState extends State<NewsDetailsEn> {
  late double height, width;
  dynamic newsitem;

  _NewsDetailsState(this.newsitem);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print(newsitem);
          }),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage('${newsitem['urlToImage']}'),
                            fit: BoxFit.cover)),
                    height: height * 0.4,
                    width: double.infinity,
                  ),
                ],
              ),
              Positioned(
                top: height * 0.3,
                child: Material(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: const Radius.circular(30)),
                  child: Container(
                    clipBehavior: Clip.none,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    width: width,
                    height: height * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${newsitem['title']}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${newsitem['description']}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

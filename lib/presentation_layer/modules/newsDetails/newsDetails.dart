import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails(this.newsitem);
  dynamic newsitem;
  @override
  State<NewsDetails> createState() => _NewsDetailsState(newsitem);
}

class _NewsDetailsState extends State<NewsDetails> {
  late double height, width;
  dynamic newsitem;

  _NewsDetailsState(this.newsitem);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
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
                  child: SingleChildScrollView(
                    child: Material(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      child: Container(
                        clipBehavior: Clip.none,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        width: width,
                        height: height * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0.8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "${newsitem['title']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '${newsitem['description']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

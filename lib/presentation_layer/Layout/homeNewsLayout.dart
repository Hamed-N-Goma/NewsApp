import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:itmc323/busniss_logic_layer/cubit/news_cubit.dart';
import 'package:itmc323/data_layer/remote/dio.dart';
import 'package:itmc323/presentation_layer/modules/bbcNews/bbcNews.dart';
import 'package:itmc323/presentation_layer/modules/headlines/headlines.dart';
import 'package:itmc323/presentation_layer/modules/newsLy_screen/newsLy.dart';
import 'package:itmc323/presentation_layer/modules/sports/sportsScreen.dart';

import '../modules/searchscreen/searchscreen.dart';

class HomeNewsLayout extends StatefulWidget {
  const HomeNewsLayout({Key? key}) : super(key: key);

  @override
  State<HomeNewsLayout> createState() => _HomeNewsLayoutState();
}

class _HomeNewsLayoutState extends State<HomeNewsLayout>
    with SingleTickerProviderStateMixin {
  TabController? tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
    super.initState();
  }

  Widget noEnterntWidget() {
    return Center(
        child: Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Text(
            'Can\'t Connect Check Internet',
            style: TextStyle(fontSize: 22, color: Colors.deepPurple),
          ),
          Image.asset('assets/images/noConnection.png')
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        var Cubit = NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "News Hero",
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SrearchScreen())));
                      },
                      icon: const Icon(Icons.search_outlined)),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                onTap: (value) {
                  Cubit.changeTabBar(value);
                },
                tabs: Cubit.tabslist,
                controller: tabcontroller,
              ),
            ),
            body: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  Cubit.getAllData;
                  return TabBarView(
                    controller: tabcontroller,
                    children: const [
                      NewsLy(),
                      HeadLines(),
                      sportsScreen(),
                      BbcNews(),
                    ],
                  );
                } else {
                  return noEnterntWidget();
                }
              },
              child: const CircularProgressIndicator(),
            ));
      },
    );
  }
}

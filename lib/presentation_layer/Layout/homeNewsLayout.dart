import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/busniss_logic_layer/cubit/news_cubit.dart';
import 'package:itmc323/presentation_layer/modules/drawer/drawer.dart';

class HomeNewsLayout extends StatelessWidget {
  const HomeNewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          var Cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title: const Text(
                  "ITMC323 News",
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search_outlined))
                ]),
            drawer: MyDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: Cubit.navBarIndex,
              onTap: (value) {
                Cubit.ChangeBottomNaveBar(value);
              },
              items: Cubit.buttomNaveBarItems,
            ),
            body: Cubit.screens[Cubit.navBarIndex],
          );
        },
      ),
    );
  }
}

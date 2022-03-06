import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/busniss_logic_layer/cubit/news_cubit.dart';

import '../newsdetails_En/newsDetailsEn.dart';

class SrearchScreen extends StatelessWidget {
  SrearchScreen({Key? key}) : super(key: key);
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = NewsCubit.get(context);
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text("Search"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller,
                  onTap: () {
                    controller.clear();
                    list.clear();
                    Cubit.search.clear();
                  },
                  onFieldSubmitted: (value) {
                    Cubit.searchigKey(value);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      border: OutlineInputBorder()),
                ),
                Expanded(
                  child: ConditionalBuilder(
                      condition: state is! LodingNews,
                      builder: (context) => ListView.separated(
                          itemBuilder: (context, index) =>
                              newsitems(list[index], context),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemCount: list.length),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget newsitems(newsitem, context) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsDetailsEn(newsitem)));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('${newsitem['urlToImage']}')),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 5,
                      child: Container(
                        height: 80,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "${newsitem['title']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}

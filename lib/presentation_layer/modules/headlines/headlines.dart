import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/presentation_layer/modules/newsDetails/newsDetails.dart';

import '../../../busniss_logic_layer/cubit/news_cubit.dart';

class HeadLines extends StatelessWidget {
  const HeadLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).headlines;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) =>
                      newsitems(list[index], context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: list.length),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  Widget newsitems(newsitem, context) => InkWell(
        onTap: () {
          print(newsitem);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsDetails(newsitem)));
        },
        child: SafeArea(
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
                                        fontWeight: FontWeight.w500),
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
        ),
      );
}

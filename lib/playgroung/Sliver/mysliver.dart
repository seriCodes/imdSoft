import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
// import 'package:provider/provider.dart';
// import 'package:sliver_tools_example/model/news_section.dart';
// import 'package:sliver_tools_example/provider/news_provider.dart';
// import 'package:sliver_tools_example/widget/news_section_widget.dart';

class MySliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Tools'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MultiSliver(
              pushPinnedChildren: true,
              children: [
                SliverStack(
                  insetOnOverlap: true,
                  children: [
                    SliverPositioned.fill(
                      top: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ),
                    MultiSliver(
                      children: [
                        SliverPinnedHeader(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[300])),
                              ),
                              child: Text("my SliverPinnedHeader"),
                            ),
                          ),
                        ),
                        SliverClip(
                          child: MultiSliver(
                            children: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => Container(
                                    key: UniqueKey(),
                                    child: Text('SliverList itemn ${index}'),
                                  ),
                                  childCount: 90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          //!second header
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MultiSliver(
              pushPinnedChildren: true,
              children: [
                SliverStack(
                  insetOnOverlap: true,
                  children: [
                    SliverPositioned.fill(
                      top: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ),
                    MultiSliver(
                      children: [
                        SliverPinnedHeader(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[300])),
                              ),
                              child: Text("Sקבםמג SliverPinnedHeader"),
                            ),
                          ),
                        ),
                        SliverClip(
                          child: MultiSliver(
                            children: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => Container(
                                    key: UniqueKey(),
                                    child: Text('SliverList itemn ${index}'),
                                  ),
                                  childCount: 90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//   List<Widget> buildNews({@required List<NewsSection> news}) => news
//       .map((newsSection) =>
//           NewsSectionWidget(section: newsSection, news: newsSection.news))
//       .toList();
}

  // sliver: Center(
            //   child: Text("my sliver1"),
            // ),
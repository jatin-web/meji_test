import 'package:flutter/material.dart';

import 'package:meji_digital_test/constants.dart';
import 'package:meji_digital_test/data/mock_data.dart';
import 'package:meji_digital_test/presentation/components/cards/news_card.dart';
import 'package:meji_digital_test/presentation/components/cards/service_card.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {

  final List<String> _homeTabs = [
    "Latest",
    "Jobs",
    "Properties",
    "Cars",
    "Services",
    "Plans"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _homeTabs.length,
      child: Column(
        children: [
          Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.5)),
          TabBar(
              isScrollable: true,
              dividerColor: Colors.white,
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              tabs: _homeTabs.map((e) => Tab(text: e)).toList()),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                isDense: true,
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mockNewsList.length,
                      itemBuilder: (context, index) {
                        return NewsCard(news: mockNewsList[index]);
                      }),
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Book Services",
                            style: TextStyle(fontSize: 16, color: themeColor),
                          ),
                        ),
                        Container(
                          height: 160,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(width: 15),
                              for (int i = 0; i < servicesList.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, bottom: 10),
                                  child: ServiceCard(service: servicesList[i]),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

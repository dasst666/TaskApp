import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabBarPage());
  }
}

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBar(
                // toolbarHeight: 60,
                // elevation: 0,
                bottom: TabBar(
                  tabs: const [
                    TabItem(title: 'Undone', count: 1),
                    TabItem(title: 'Meetings', count: 6),
                    TabItem(title: 'Consumptions', count: 8)
                  ],
                  // overlayColor: MaterialStateProperty.all(Colors.transparent),
                  // splashFactory: InkRipple.splashFactory,
                  labelColor: Colors.blue,
                  dividerColor: const Color.fromARGB(0, 17, 11, 11),

                  indicator: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                ),
                toolbarHeight: 200,
                title: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                            Text(
                              "18 Jun 2019, Tuesday",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                        Icon(Icons.calendar_month)
                      ],
                    ),
                    SizedBox(height: 10,),
                    SearchWidget(),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ]),
        ));
  }
}

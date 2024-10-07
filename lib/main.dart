import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'search.dart';
import 'card_item.dart';
import 'add_screen.dart';

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
                    SizedBox(
                      height: 10,
                    ),
                    SearchWidget()
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(children: [
            Icon(Icons.dangerous),
            Column(
              children: [
                CardItem(
                  title: 'Go to school',
                  subtitle: 'Take pencil',
                ),
                CardItem(
                  title: 'Drink water',
                  subtitle: 'Go to market',
                ),
              ],
            ),
            Icon(Icons.directions_bike),
          ]),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: FloatingActionButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const AddScreen()));
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return DraggableScrollableSheet(
                          initialChildSize: 0.8,
                          minChildSize: 0.4,
                          maxChildSize: 0.9,
                          builder: (_, controller) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: AddScreen(scrollController: controller),
                              ),
                            );
                          });
                    });
              },
              backgroundColor: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  Text(
                    "Add new task",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}

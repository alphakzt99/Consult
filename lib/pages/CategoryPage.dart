import 'package:consult_app/pages/main_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  late final int controllerIndex;
  late final int cateIndex;
  List dict;
  CategoryPage(
      {super.key,
      required this.controllerIndex,
      required this.dict,
      required this.cateIndex});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);
  ScrollController _controller = ScrollController();


  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool selected = false; 
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FluentIcons.arrow_circle_left_20_filled,
              size: 32,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FluentIcons.search_20_regular,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Theme.of(context).backgroundColor,
            width: size.width,
            height: size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Explore",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "Consultants",
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: size.width * 0.3,
                height: 10,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: TabBar(
                  labelStyle: Theme.of(context).primaryTextTheme.bodyText2,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "Roboto",color: Colors.white
                  ),
                  labelColor: Theme.of(context).backgroundColor,
                  unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                    indicatorWeight: 0.1,
                    indicator:
                        BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(10)),
                    controller: tabController,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Education",
                      ),
                      Tab(
                        text: "Mental Health",
                      ),
                      Tab(
                        text: "Business",
                      )
                    ]),
              ),
              TabBarView(
                controller: tabController,
                children: [
                  Card(
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                  
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/photos/avatar.jpg"))),),
                            Row(children: [
                              
                            ],)
                        ],
                      )
                    ]),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              Text(
                widget.controllerIndex == 0 && widget.cateIndex == 0
                    ? dict[0][0][0].toString()
                    : widget.controllerIndex == 0 && widget.cateIndex == 1
                        ? dict[0][1][0].toString()
                        : widget.controllerIndex == 0 && widget.cateIndex == 2
                            ? dict[0][2][0]
                            : widget.controllerIndex == 1 &&
                                    widget.cateIndex == 0
                                ? dict[1][0][0]
                                : widget.controllerIndex == 1 &&
                                        widget.cateIndex == 1
                                    ? dict[1][1][0]
                                    : widget.controllerIndex == 1 &&
                                            widget.cateIndex == 2
                                        ? dict[1][2][0]
                                        : widget.controllerIndex == 2 &&
                                                widget.cateIndex == 0
                                            ? dict[2][0][0]
                                            : widget.controllerIndex == 2 &&
                                                    widget.cateIndex == 1
                                                ? dict[2][1][0]
                                                : dict[2][2][0].toString(),
                style: Theme.of(context).textTheme.headline5,
              )
            ]),
          ),
        ));
  }
}

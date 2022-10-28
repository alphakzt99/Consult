import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/fluent.dart';

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
  ScrollController controller = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    var size = MediaQuery.of(context).size;

    Widget cardItem() {
      return ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: 4,
          itemBuilder: ((context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("lib/photos/avatar.jpg"))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.headline4,
                              children: [
                                TextSpan(text: 'Rating'),
                                TextSpan(text: '             \$18')
                              ]),
                        ),
                        RichText(
                            text: TextSpan(
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                                children: [
                              TextSpan(text: "25 "),
                              TextSpan(text: "reviews"),
                              TextSpan(text: "    per hr")
                            ]))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Consultant",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Iconify(
                                AntDesign.safety_certificate_outlined,
                                color: Colors.greenAccent,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "314 clients",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.headline5,
                                  children: [
                                TextSpan(text: "Category"),
                                TextSpan(text: "      Field")
                              ])),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                elevation: 0,
                                color: Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  "Book",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MaterialButton(
                                elevation: 0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  "Message",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )));
    }

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
      body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Theme.of(context).backgroundColor,
          width: size.width,
          height: size.height * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: NestedScrollView(
                  headerSliverBuilder:(context,bool){
                    return<Widget>[ SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      sliver: TabBar(
                      labelStyle: Theme.of(context).primaryTextTheme.bodyText2,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                          color: Colors.white),
                      labelColor: Theme.of(context).backgroundColor,
                      unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                      indicatorWeight: 0.1,
                      indicator: BoxDecoration(
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
                      )];
                  },
                   body: Container(
                  width: size.width,
                  height: size.height,
                  child: TabBarView(
                      controller: tabController,
                      children: [cardItem(), cardItem(), cardItem(), cardItem()]))
                ),
              ),
             
             
            ],
          ),
        ),
      
    );
  }
}

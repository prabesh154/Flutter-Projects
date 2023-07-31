import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 1,
          title: const Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 70,
                  color: Colors.white,
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pinkAccent),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.pinkAccent, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Babies"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.pinkAccent, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Mens"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.pinkAccent, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Womens"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            showDialogFun(context);
                          },
                          title: Text("Babies List $index"),
                          subtitle: const Text("Tab bar ui"),
                          trailing: const Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          title: Text("Mens List $index"),
                          subtitle: const Text("Tab bar ui"),
                          trailing: const Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            // showDialog(context: context, builder: builder){}
                          },
                          title: Text("Womens List $index"),
                          subtitle: const Text("Tab bar ui"),
                          trailing: const Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

showDialogFun(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
          type: MaterialType.transparency,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRect(
                    child: Image.asset(
                      'assets/images/makeup.png',
                      width: 200,
                      height: 200,
                    ),
                  )
                ],
              )),
        ));
      });
}

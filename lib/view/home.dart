import 'package:api_integration/models/models.dart';
import 'package:api_integration/repo/repo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ProductModel> data = [];
  late List<ProductModel> filterData = [];
  late List<String?> CategoryList;
  String? Cat;

  @override
  void initState() {
    // TODO: implement initState
    productdata();

    super.initState();
  }

  void productdata() async {
    data = await DataService().getService();

    Cat = data[0].category;
    filterData = data.where((element) => element.category == Cat).toList();
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    CategoryList = data
        .map(
          (e) => e.category,
        )
        .toList()
        .toSet()
        .toList();
    print("............................$CategoryList");
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(icon: Icon(Icons.directions_car)),
        //     Tab(icon: Icon(Icons.directions_transit)),
        //     Tab(icon: Icon(Icons.directions_bike)),
        //   ],
        // )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 5 / 7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: Image.network(
                                  data[index].image.toString(),
                                  //filterData[index].image.toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Text(
                                    data[index].title.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(data[index].price.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)),
                                      Text(
                                        data[index].rating!.rate.toString(),
                                          // filterData[index]
                                          //     .rating!
                                          //     .rate
                                          //     .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)),
                                      SingleChildScrollView()
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

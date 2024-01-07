import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> horizontalContainerData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is created
  }

  // Function to fetch data from API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        horizontalContainerData = data.map((item) => item.toString()).toList();
      });
    } else {
      // Handle error
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E0F41),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 50, left: 5, right: 5, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF69ACF0),
                ),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildSlideContainer(),
                    _buildSlideContainer(),
                    _buildSlideContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildDotIndicator(),
              const SizedBox(height: 10),
              const Text(
                "Trading Breathwork",
                style: TextStyle(color: Colors.white),
              ),
              _buildHorizontalContainerList(),
              const Text(
                "Your Breathwork",
                style: TextStyle(color: Colors.white),
              ),
              _buildHorizontalContainerList(),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF5F7FCA),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: Text(
                          "you have 1 credit avilable to create personalized video",
                          style: TextStyle(
                              color: Color(0xFFFDFCFC),
                              overflow: TextOverflow.visible),
                        ),
                      ),
                      Container(
                        height: 40,
                        
                        width: 150,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue),
                        child: const Row(children: [
                          Icon(
                            Icons.brightness_medium,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "CREATE  VIDEO",
                            style: TextStyle(
                                color: Color(0xFFFDFCFC),
                                overflow: TextOverflow.visible),
                          ),
                        ]),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
      ]),
    );
  }

  Widget _buildSlideContainer() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "My Prayers. Club",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFDFCFC),
                overflow: TextOverflow.visible),
          ),
          const Text(
            "Created AI generated personalized breathing excersise video as per your feelings",
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFFFDFCFC),
                overflow: TextOverflow.visible),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            width: 200,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.blue),
            child: const Row(children: [
              Icon(
                Icons.brightness_medium,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text(
                "CREATE YOUR VIDEO",
                style: TextStyle(
                    color: Color(0xFFFDFCFC), overflow: TextOverflow.visible),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Number of pages
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}

Widget _buildHorizontalContainerList() {
  return Container(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5, // Number of containers in the list
      itemBuilder: (context, index) {
        return _buildHorizontalContainer();
      },
    ),
  );
}

Widget _buildHorizontalContainer() {
  return Column(
    children: [
      Container(
        width: 150,
        height: 90,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orangeAccent, // Change color as needed
        ),
      ),
      const SizedBox(
        width: 150,
        child: Text(
          "Mango your Anger with dum mantra",
          style: TextStyle(
              color: Color(0xFFFDFCFC), overflow: TextOverflow.visible),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();
  List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
        title: "Onboarding Page 1",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. nunc est aliquam nunc, euismod aliquam nunc nunc eu nunc.",
        image: "assets/images/onboarding1.png"),
    OnBoardingItem(
        title: "Onboarding Page 2",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. nunc est aliquam nunc, euismod aliquam nunc nunc eu nunc.",
        image: "assets/images/onboarding2.png"),
    OnBoardingItem(
        title: "Onboarding Page 3",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. nunc est aliquam nunc, euismod aliquam nunc nunc eu nunc.",
        image: "assets/images/onboarding3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPage < onBoardingItems.length - 1)
            // ignore: curly_braces_in_flow_control_structures
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Skip'),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: onBoardingItems.length,
                  itemBuilder: (context, index) {
                    final item = onBoardingItems[index];
                    return Column(
                      children: [
                        Image.asset(item.image),
                        const SizedBox(height: 25),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          item.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: _currentPage == index ? 50 : 10,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingItem {
  final String title;
  final String description;
  final String image;

  OnBoardingItem(
      {required this.title, required this.description, required this.image,});
}

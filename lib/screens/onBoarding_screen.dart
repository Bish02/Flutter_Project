import 'package:flutter/material.dart';
import '../components/login_page.dart';
import '../config/theme.dart';
import 'home_screen.dart';

// String imageUrl = 'https://source.unsplash.com/400x500/?chatapp';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    // Use Navigator to navigate to the home screen
    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(builder: (context) => const HomeScreen()),
      MaterialPageRoute(builder: (context) => Loginpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => _onBoardContent(
                          image: demo_data[index].image,
                          title: demo_data[index].title,
                          description: demo_data[index].description,
                        )),
              ),
              Row(
                children: [
                  // const dotIndicator(),
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: dotIndicator(
                              isActive: index == pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      // onPressed: () {
                      //   _pageController.nextPage(
                      //       duration: const Duration(milliseconds: 300),
                      //       curve: Curves.ease);
                      // },
                      onPressed: () {
                        if (pageIndex < demo_data.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          _navigateToHome(); // Navigate to home screen
                        }
                      },

                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.deepPurple[400]),
                      child: Image.asset(
                        'assets/images/right-arrow.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class dotIndicator extends StatelessWidget {
  const dotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color:
              isActive ? Colors.deepPurple : Colors.deepPurple.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12.0)),
    );
  }
}

class onBoard {
  late final String image, title, description;
  onBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<onBoard> demo_data = [
  onBoard(
    // image: imageUrl,
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
  onBoard(
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
  onBoard(
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
  onBoard(
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
  onBoard(
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
  onBoard(
    image: 'assets/images/Live Chat.gif',
    title: ' Hello what are You Looking for',
    description:
        'Here you can chat with your loved once , and it will work like the tinder app is a very use full features here',
  ),
];

class _onBoardContent extends StatelessWidget {
  const _onBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer()
      ],
    );
  }
}

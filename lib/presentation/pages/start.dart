import 'package:flutter/material.dart';
import 'package:planty/presentation/pages/home.dart';
import 'package:planty/utils/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  final imageCarousel = ["1.png", "2.png", "3.png"];
  var selected = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              // Go home
            },
            child: Text(
              "Skip",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height:
            MediaQuery.sizeOf(context).height - AppBar().preferredSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // direction: Axis.vertical,
          children: [
            // floating image
            Expanded(
              flex: 3,
              child: GestureDetector(
                // onHorizontalDragStart: (details) {

                // },
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // User swiped Left
                    setState(() {
                      if (selected == 0) {
                        selected = imageCarousel.length - 1;
                      } else {
                        selected -= 1;
                      }
                    });
                  } else if (details.primaryVelocity! < 0) {
                    // User swiped Right
                    setState(() {
                      if (selected == imageCarousel.length - 1) {
                        selected = 0;
                      } else {
                        selected += 1;
                      }
                    });
                  }
                },
                child: Column(
                  children: [
                    Expanded(
                      child: SlideTransition(
                        position: _offsetAnimation,
                        child: Image.asset(
                            "assets/images/start/${imageCarousel[selected]}"),
                      ),
                    ),
                    // indicator
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    //
                    Container(
                      height: 8,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageCarousel.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => AnimatedSwitcher(
                          duration: const Duration(microseconds: 1000),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            height: 8,
                            width: selected == index ? 24 : 8,
                            decoration: BoxDecoration(
                                color: selected == index
                                    ? AppColors.darkGreen
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(.8),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height / 2,
                    ),
                    // label
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * .7),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Enjoy your \nLife with ",
                          children: const [
                            TextSpan(
                              text: " Plants",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 36,
                                    // fontWeight: FontWeight.w200,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    // next button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 36,
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 36,
                        ),
                      ),
                    ),
                    // spacer
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

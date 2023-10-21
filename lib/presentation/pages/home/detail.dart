import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/data/models/plant.dart';
import 'package:planty/utils/theme.dart';

// TODO! Finish styling this
class PlantDetail extends StatefulWidget {
  const PlantDetail({super.key, required this.plant});
  final Plant plant;

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail>
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
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: FaIcon(FontAwesomeIcons.chevronLeft),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FaIcon(FontAwesomeIcons.cartShopping),
          )
        ],
      ),
      body: SizedBox(
        height:
            MediaQuery.sizeOf(context).height - AppBar().preferredSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // direction: Axis.vertical,
          children: [
            Expanded(
              child: GestureDetector(
                onVerticalDragEnd: (details) {
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
                    Container(
                      height: 8,
                      alignment: Alignment.bottomRight,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
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
              child: Column(
                children: [
                  SizedBox(
                    height: AppBar().preferredSize.height / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * .8),
                        child: Text(
                          "Lucky-jade-plant",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * .8),
                        child: Text(
                          "Plants make your life with minimal and happy love the plants more and enjoy life.",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppBar().preferredSize.height / 2,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                          "assets/icons/height.png")),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Height",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text("30cm - 40cm",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.6)))
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                          "assets/icons/temprature.png")),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Temprature",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text("20* - 25*",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.6)))
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                      child:
                                          Image.asset("assets/icons/pot.png")),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Pot",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text("30cm - 40cm",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.6)))
                                ],
                              ),
                            ],
                          )),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Total Price",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary
                                                    .withOpacity(.8))),
                                    Text(
                                      "\$12.99",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  child: Center(
                                    child: Text(
                                      "Add to cart",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

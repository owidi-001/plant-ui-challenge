import 'package:flutter/material.dart';
import 'package:planty/presentation/pages/home.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final imageCarousel = ["1.webp", "2.jpg", "3.jpg"];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
              ),
            ],
          ),
          body: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.vertical,
            children: [
              // floating image
              Flexible(
                  flex: 2,
                  child: Image.asset(
                      "assets/images/start/${imageCarousel[selected]}")),
              // indicator
              Container(
                height: 40,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageCarousel.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Icon(
                    Icons.circle,
                    color: selected == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.tertiary,
                    size: 12,
                  ),
                ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              // label
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * .7),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: "Enjoy your life with ",
                      children: const [
                        TextSpan(
                          text: " Plants",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 36, fontWeight: FontWeight.w300)),
                ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              // next button
              GestureDetector(
                onTap: () {
                  if (selected == 2) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  } else {
                    setState(() {
                      selected += 1;
                    });
                  }
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
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
          )),
    );
  }
}

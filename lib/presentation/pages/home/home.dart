import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/data/models/plant.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:planty/presentation/pages/home/widgets/plant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _items = [
      Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 2),
          child: Text(
            "Found 10 Results",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          )),
      ...List.generate(
          15,
          (index) => const PlantCard(
                plant: Plant(
                  name: "Lucky Jade Plant",
                  price: 12.19,
                  imageUrl: "assets/images/start/1.png",
                  bookmarked: false,
                ),
              ))
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: const Text(
                "Planty",
              ),
              actions: [
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset(
                    "assets/images/avatar.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
              expandedHeight: AppBar().preferredSize.height + 80,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfff9f9f9),
                              ),
                              alignment: Alignment.centerLeft,
                              child: const TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      size: 18,
                                    ),
                                  ),
                                  isDense: true,
                                  hintText: "Search",
                                  // border: InputBorder.none,
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfff9f9f9)),
                            child: const Center(
                                child: FaIcon(
                              FontAwesomeIcons.sliders,
                              size: 18,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: AppBar().preferredSize.height / 2,
              ),
            ),

            // grid tiles
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: MasonryView(
                  listOfItem: _items,
                  numberOfColumn: 2,
                  itemBuilder: (item) {
                    return item;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

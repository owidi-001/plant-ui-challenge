import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/data/models/plant.dart';
import 'package:planty/presentation/pages/detail.dart';

// TODO! style and add shadow

class PlantCard extends StatelessWidget {
  const PlantCard({super.key, required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Open to detail view
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PlantDetail(plant: plant)));
      },
      child: Container(
        height: 300,
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          children: [
            // Image
            Container(
                height: 200,
                child: Image.asset(
                  plant.imageUrl,
                  fit: BoxFit.fitHeight,
                )),
            const SizedBox(
              height: 10,
            ),
            // Name
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // price & action

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${plant.price}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  child: FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

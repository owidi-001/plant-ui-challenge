import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/utils/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.asset(
                      'assets/images/start/2.png',
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Örange',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '\$24.00',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$12.00',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: StaticColors.black,
                                  foregroundColor: Colors.white,
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                "02",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: StaticColors.black),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: StaticColors.black,
                                  foregroundColor: Colors.white,
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.xmark,
                  size: 18,
                ),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}

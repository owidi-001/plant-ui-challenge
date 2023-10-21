import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/presentation/pages/cart/widgets/cart_card.dart';
import 'package:planty/presentation/pages/cart/widgets/dotted_divider.dart';
import 'package:planty/utils/theme.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              useRootNavigator: true,
              useSafeArea: true,
              context: context,
              builder: (context) => const CheckoutDialog());
        },
        child: const FaIcon(FontAwesomeIcons.basketShopping),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              title: const Text(
                "Cart",
              ),
              expandedHeight: AppBar().preferredSize.height + 50,
              floating: true,
              pinned: false,
              snap: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.trash,
                      ),
                    ))
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0 Items',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36))),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => const CartCard()),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: AppBar().preferredSize.height + 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckoutDialog extends StatelessWidget {
  const CheckoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub total",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                "\$62.00",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(
            height: 24,
            child: DottedLineDivider(
              height: 1,
              color: StaticColors.black.withOpacity(.6),
              thickness: 2,
              dashWidth: 5,
              dashSpace: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                "\$62.00",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                          foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.onPrimary),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          fixedSize: const MaterialStatePropertyAll(
                              Size(double.maxFinite, 60))),
                      onPressed: () {},
                      child: const Text("Place to Order")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

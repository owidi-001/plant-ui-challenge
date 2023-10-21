import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              title: const Text(
                "Settings",
              ),
              expandedHeight: AppBar().preferredSize.height,
              floating: true,
              pinned: false,
              snap: true,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(background: Container()),
            ),
            // General
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "General".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.user),
                        title: const Text('Account'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.bell),
                        title: const Text('Notifications'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.lock),
                        title: const Text('Security'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: FaIcon(FontAwesomeIcons.rightFromBracket,
                            color: Theme.of(context).colorScheme.error),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        ),
                        trailing: FaIcon(FontAwesomeIcons.chevronRight,
                            color: Theme.of(context).colorScheme.error),
                      ),
                      const Divider(),
                    ],
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "feedback".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading:
                            const FaIcon(FontAwesomeIcons.triangleExclamation),
                        title: const Text('Report a bug'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.paperPlane),
                        title: const Text('Send feedback'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                    ],
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "info".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.circleQuestion),
                        title: const Text('About'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const FaIcon(FontAwesomeIcons.user),
                        title: const Text('Get Support'),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                      ),
                      const Divider(),
                    ],
                  )
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: AppBar().preferredSize.height + 50,
                child: const Center(child: Text("version 1.0.0")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/presentation/pages/messages/chat.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool searchOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: false,
        title: searchOpened
            ?
            // Search messages
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchOpened = !searchOpened;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfff9f9f9)),
                            child: const Center(
                                child: FaIcon(
                              FontAwesomeIcons.xmark,
                              size: 18,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
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
                                hintText: "Search in messages",
                                // border: InputBorder.none,
                                alignLabelWithHint: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Text(
                "Messages",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
        actions: searchOpened
            ? []
            : [
                IconButton(
                    onPressed: () {
                      setState(() {
                        searchOpened = !searchOpened;
                      });
                    },
                    icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.camera))
              ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.ellipsisVertical))
                ],
              ),
            ),
            // Status bar
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(right: 16),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/start/1.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChatScreen()));
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                title: const Text("John Doe"),
                subtitle: const Text("The quick brown fox"),
                trailing: Icon(
                  Icons.circle,
                  size: 10,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),
            SizedBox(
              height: AppBar().preferredSize.height + 50,
            )
          ],
        ),
      ),
    );
  }
}

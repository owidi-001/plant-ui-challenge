import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/presentation/pages/messages/widgets/conversation_list.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool searchOpened = false;

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "18 Feb"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://www.bing.com/images/search?view=detailV2&ccid=audMX4ZG&id=A93A881CEFCDB707F02F3FD4AE68C81B21A034E4&thid=OIP.audMX4ZGbvT2_GJTx2c4GgHaHw&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6ae74c5f86466ef4f6fc6253c767381a%3frik%3d5DSgIRvIaK7UPw%26riu%3dhttp%253a%252f%252fwww.pngall.com%252fwp-content%252fuploads%252f5%252fProfile-Avatar-PNG.png%26ehk%3dGVMh4KTpyOBERsOt5H%252b8TcGp%252bS8DdbR6niBs54kRaYA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=900&expw=860&q=profile+icon+image&simid=608052960356036407&FORM=IRPRST&ck=23CFBFA612D5159C5A834B6AD9422CD5&selectedIndex=11&qft=+filterui%3aaspect-square+filterui%3aphoto-transparent",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: const Text(
                "Messages",
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                      ),
                    ))
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: chatUsers.length,
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time});
}

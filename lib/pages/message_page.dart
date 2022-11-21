import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mediator/helper.dart';
import 'package:mediator/models/models.dart';
import 'package:mediator/utils/theme.dart';
import 'package:mediator/widgets/widgets.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Stories(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(_delegate))
      ],
    );
  }
}

Widget _delegate(BuildContext context, int index) {
  final faker = Faker();
  final date = Helpers.randomDate();
  return _MessageTitle(
      messageData: MessageData(
          senderName: faker.person.name(),
          message: faker.lorem.sentence(),
          messgaeDate: date,
          dateMessage: Jiffy(date).fromNow(),
          profilePicture: Helpers.randomPictureUrl()));
}

class _MessageTitle extends StatelessWidget {
  const _MessageTitle({super.key, required this.messageData});
  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      elevation: 0,
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Container(
            height: 80,
            margin: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 10.0, bottom: 10.0, right: 20),
                  child: Avatar.medium(url: messageData.profilePicture),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        messageData.message.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          messageData.dateMessage.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        )),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          color: AppColors.secondary, shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color: AppColors.textLigth),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 134,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                left: 16.0,
              ),
              child: Text(
                "Stories",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textFaded),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Helpers.randomPictureUrl().length,
                itemBuilder: (context, index) {
                  final faker = Faker();
                  return _StoryCard(
                      storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({super.key, required this.storyData});
  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Avatar.medium(url: storyData.url),
          Expanded(
            child: SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  storyData.name,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 11.0,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

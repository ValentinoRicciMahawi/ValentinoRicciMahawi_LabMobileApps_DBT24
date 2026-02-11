import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/story_widget.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            elevation: 0,
            title: const Text(
              'Instagram',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'serif',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 106,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemCount: MockData.stories.length,
                    itemBuilder: (context, index) {
                      return StoryWidget(
                        user: MockData.stories[index],
                        isFirst: index == 0,
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey[850],
                  height: 0.5,
                  thickness: 0.5,
                ),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < MockData.posts.length) {
                  return Column(
                    children: [
                      PostCard(post: MockData.posts[index]),
                      Divider(
                        color: Colors.grey[850],
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ],
                  );
                }
                return null;
              },
              childCount: MockData.posts.length,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";

class FeedListPage extends StatelessWidget {
  FeedListPage({super.key});
  final List<Post> posts = [
    Post(
      name: "Sophia Clark",
      time: "1d",
      content:
          "Just tried the new vegan burger at The Green Leaf Cafe, and it’s a game-changer! The patty is incredibly flavorful...",
      imageUrl:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c", // Replace with your image
      avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
      likes: 23,
      comments: 5,
      shares: 2,
    ),
    Post(
      name: "Ethan Miller",
      time: "2d",
      content:
          "Had the most amazing sushi at Ocean’s Catch tonight. The freshness of the fish was unparalleled...",
      imageUrl:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c", // Replace with your image
      avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
      likes: 18,
      comments: 3,
      shares: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add your action here
              print('Plus icon tapped');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostCard(post: posts[index]),
      ),
    );
  }
}

class Post {
  final String name;
  final String time;
  final String content;
  final String imageUrl;
  final String avatarUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.name,
    required this.time,
    required this.content,
    required this.imageUrl,
    required this.avatarUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(post.avatarUrl)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(post.time, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          // Text Content
          Text(post.content),
          SizedBox(height: 10),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(post.imageUrl),
          ),
          SizedBox(height: 10),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconText(
                icon: Icons.favorite_border,
                text: post.likes.toString(),
              ),
              IconText(
                icon: Icons.comment_outlined,
                text: post.comments.toString(),
              ),
              IconText(
                icon: Icons.share_outlined,
                text: post.shares.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon, size: 18), SizedBox(width: 4), Text(text)],
    );
  }
}

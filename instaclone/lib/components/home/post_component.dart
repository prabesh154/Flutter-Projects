import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/post.dart';

class PostComponent extends StatefulWidget {
  const PostComponent({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  final PageController _pageController =
      PageController(); // Declare the PageController

  bool isliked = false;

  void likedChange() {
    setState(() {
      isliked = !isliked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.post.postedby.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text(
              widget.post.location,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 13),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(widget.post.postedby.image),
            ),
            trailing: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 320,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController, // Use the PageController
              itemCount: 4,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.post.imageUrl,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: likedChange,
                  icon: Icon(
                    isliked ? Icons.favorite : Icons.favorite_outline,
                    color: isliked ? Colors.red : null,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_outlined,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                    child: _buildPageIndicator(),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.post.totalLikes} likes',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: widget.post.postedby.username,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            ' ', // Adding a space between username and caption
                      ),
                      TextSpan(
                        text: widget.post.caption,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('View all ${widget.post.totalComments} comments'),
                const SizedBox(
                  height: 5,
                ),
                Text('${widget.post.postedTimeAgo} days ago')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController, // Use the same PageController
      count: 4,
      effect: const SlideEffect(
        activeDotColor: Color.fromARGB(255, 63, 114, 208),
        dotColor: Colors.grey,
        spacing: 6,
        dotWidth: 8,
        dotHeight: 8,
      ),
      onDotClicked: (index) {},
    );
  }
}





                // RichText(
                //   text: const TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'username',
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       TextSpan(
                //         text:
                //             ' ',
                //       ),
                //       TextSpan(
                //         text: 'image caption here',
                //         style: TextStyle(fontWeight: FontWeight.normal),
                //       ),
                //     ],
                //   ),
                // ),
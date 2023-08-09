import 'package:instaclone/models/user.dart';
import 'models/post.dart';
import 'models/stories.dart';

List<User> users = [
  User(
    id: 'id',
    username: 'prabesh_rj',
    image: 'https://picsum.photos/id/1062/400/400',
  ),
  User(
      id: 'id',
      username: 'manish_np',
      image:
          'https://i.pinimg.com/736x/43/14/82/431482fcc23b3e9620fc42b99fb087ec--srk-movies-bollywood-actors.jpg')
];

List<Story> storyList = [
  Story('id', users[0]),
  Story('id', users[1]),
  Story('id', users[0]),
  Story('id', users[1]),
  Story('id', users[0]),
  Story('id', users[0]),
];

List<Post> postList = [
  Post(
      'id',
      users[0],
      'https://picsum.photos/seed/picsum/200/300',
      'Hello Hi there!',
      'Kathmandu',
      'Beautiful weather here',
      '2',
      '133',
      '22',
      false,
      false),
  Post(
      'id',
      users[1],
      'https://picsum.photos/200/300?grayscale',
      'Hello Hi there!',
      'Kathmandu',
      'Amazing Temperature here',
      '2',
      '133',
      '22',
      false,
      false),
  Post(
      'id',
      users[1],
      'https://i.pinimg.com/736x/43/14/82/431482fcc23b3e9620fc42b99fb087ec--srk-movies-bollywood-actors.jpg',
      'Hello Hi there!',
      'Butwal',
      'King Khan in Mood',
      '2',
      '123',
      '32',
      false,
      false),
  Post(
      'id',
      users[0],
      'https://picsum.photos/seed/picsum/200/300',
      'Hello Hi there!',
      'Kathmandu',
      'Beautiful weather here',
      '3',
      '23',
      '3',
      false,
      false),
  Post(
      'id',
      users[0],
      'https://picsum.photos/200/300?grayscale',
      'Hello Hi there!',
      'Lalitpur',
      'Nice picture',
      '23',
      '3233',
      '23',
      false,
      false),
  Post(
      'id',
      users[0],
      'https://picsum.photos/seed/picsum/200/300',
      'Hello Hi there!',
      'Kathmandu',
      'Beautiful weather here',
      '2',
      '133',
      '22',
      false,
      false),
];

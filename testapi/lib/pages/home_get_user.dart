import 'package:flutter/material.dart';
import 'package:testapi/pages/add_user_screen.dart';
import '../models/user_models.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Showing User Data"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddUserScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<UserModels>?>(
        future: userRepository.getUserdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            List<UserModels> itemList = snapshot.data!;
            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                UserModels user = itemList[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.position),
                  leading: IconButton(
                    onPressed: () async {
                      await userRepository.deleteUserData(user);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUserScreen(
                            name: user.name,
                            position: user.position,
                            id: user.id,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  onTap: () async {
                    await userRepository.postUserData(UserModels(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: "name",
                      position: "position",
                    ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

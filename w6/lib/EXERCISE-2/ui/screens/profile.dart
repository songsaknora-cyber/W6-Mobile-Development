import 'package:flutter/material.dart';
import '../../model/profile_tile_model.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    List<ProfileTile> profileTiles = [];

    for (TileData td in profileData.tiles) {
      ProfileTile widget = ProfileTile(
        icon: td.icon,
        title: td.title,
        data: td.value,
      );
      profileTiles.add(widget);
    }

    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      //// This is without ListView
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       const SizedBox(height: 40),
      //       CircleAvatar(
      //         radius: 60,
      //         backgroundImage: AssetImage(profileData.avatarUrl),
      //       ),
      //       SizedBox(height: 20),
      //       Text(
      //         profileData.name,
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //           color: AppColors.primary,
      //         ),
      //       ),
      //       Text(
      //         profileData.position,
      //         style: TextStyle(fontSize: 16, color: Colors.grey),
      //       ),
      //       const SizedBox(height: 20),

      //       ...profileTiles,

      //     ],
      //   ),
      // ),

      //// This is ListView with children
      // body: ListView(
      //   children: [
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const SizedBox(height: 40),
      //         CircleAvatar(
      //           radius: 60,
      //           backgroundImage: AssetImage(profileData.avatarUrl),
      //         ),
      //         SizedBox(height: 20),
      //         Text(
      //           profileData.name,
      //           style: TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //             color: AppColors.primary,
      //           ),
      //         ),
      //         Text(
      //           profileData.position,
      //           style: TextStyle(fontSize: 16, color: Colors.grey),
      //         ),
      //       ],
      //     ),

      //     const SizedBox(height: 20),

      //     ...profileTiles,
      //   ],
      // ),

      //// With ListView.builder function
      body: ListView.builder(
        itemCount:
            profileData.tiles.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profileData.avatarUrl),
                  ),
                  SizedBox(height: 20),
                  Text(
                    profileData.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    profileData.position,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }
          // if index - 1 only, the last index wont display, so need to plus 1 at itemCount
          TileData td = profileData.tiles[index - 1];
          return ProfileTile(icon: td.icon, title: td.title, data: td.value);
        },
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}

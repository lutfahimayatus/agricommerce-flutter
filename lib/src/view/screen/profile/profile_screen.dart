// ignore: unused_import
import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  title: const Text('Keluar'),
//             trailing: const Icon(Icons.arrow_back_rounded),

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
            ),
            SizedBox(height: 20),
            Text(
              'steven',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'pelanggan',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: 5),
                Text('kalender@mail.com'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5),
                Text('08233242'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(secureStorageProvider.notifier).remove('token');
                // Aksi logout di sini
                print('Logout');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

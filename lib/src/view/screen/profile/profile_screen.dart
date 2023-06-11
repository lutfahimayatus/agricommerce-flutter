import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              ref.read(secureStorageProvider.notifier).remove('token');
            },
            title: const Text('Keluar'),
            trailing: const Icon(Icons.arrow_back_rounded),
          )
        ],
      ),
    );
  }
}

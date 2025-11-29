import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          header: true,
          label: 'Profil sahifasi',
          child: Text('Profile'),
        ),
      ),
      body: ListView(
        children: [
          // Avatar - dekorativ
          ExcludeSemantics(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('avatar.jpg'),
            ),
          ),

          // Ism va familiya - birlashtirilgan
          MergeSemantics(
            child: Column(
              children: [
                Text('Alibek', style: TextStyle(fontSize: 24)),
                Text('Karimov', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          // Screen reader: "Alibek Karimov"

          // Email - maxsus label bilan
          Semantics(
            label: 'Email manzil: alibek@example.com',
            child: Row(
              children: [
                Icon(Icons.email),
                Text('alibek@example.com'),
              ],
            ),
          ),

          // Tahrirlash tugmasi
          Semantics(
            button: true,
            label: 'Profilni tahrirlash',
            onTapHint: 'Tahrirlash sahifasiga o\'tish',
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Tahrirlash'),
            ),
          ),
        ],
      ),
    );
  }
}
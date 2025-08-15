import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Note Title',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Note Content', style: TextStyle(fontSize: 18)),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, size: 30),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Note date'),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Note Title',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text('Note Content', style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, size: 30),
                ),
                Text('Note date'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

 */

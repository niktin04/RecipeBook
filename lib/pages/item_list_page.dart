import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final Stream<QuerySnapshot> _businessesStream =
      FirebaseFirestore.instance.collection('businesses').doc('PWcUlM4jCWozNFiIlHeu').collection('items').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _businessesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return new ListTile(
                title: new Text(data['name']),
                subtitle: new Text(data['description']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

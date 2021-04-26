import 'package:flutter/material.dart';
import 'package:flutter_minggu6/models/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> items = [];

  TextEditingController nama = new TextEditingController();

  TextEditingController jumlah = new TextEditingController();

  TextEditingController harga = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nama,
                      decoration: InputDecoration(
                        labelText: "Item Name",
                        hintText: "Insert item name",
                      ),
                    ),
                    TextFormField(
                      controller: harga,
                      decoration: InputDecoration(
                        labelText: "Item Price",
                        hintText: "Insert item price",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: jumlah,
                      decoration: InputDecoration(
                        labelText: "Item Qty",
                        hintText: "Insert item qty",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    ElevatedButton(
                      child: const Text('Add Item'),
                      onPressed: () {
                        setState(() {
                          items.add(Item(
                              name: nama.text,
                              price: int.parse(harga.text),
                              jumlah: int.parse(jumlah.text)));
                          nama.clear();
                          harga.clear();
                          jumlah.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/item',
                                  arguments: item);
                            },
                            child: Card(
                              child: Container(
                                margin: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(item.name)),
                                    Expanded(
                                      child: Text(item.price.toString(),
                                          textAlign: TextAlign.end),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}

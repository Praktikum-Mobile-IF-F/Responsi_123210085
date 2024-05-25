import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> dataImport;

  const DetailPage({required this.dataImport, super.key});

  @override
  Widget build(BuildContext context) {
    return DetailPageStf(dataImport: dataImport);
  }
}

class DetailPageStf extends StatefulWidget {
  final Map<String, dynamic> dataImport;

  const DetailPageStf({required this.dataImport, super.key});

  @override
  State<DetailPageStf> createState() => _DetailPageStfState();
}

class _DetailPageStfState extends State<DetailPageStf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('nama : ${widget.dataImport['name']}'),
          Text('deskripsi : ${widget.dataImport['description']}'),
          Text('region : ${widget.dataImport['region']}'),
          Text('price : ${widget.dataImport['price']}'),
        ],
      ),
    );
  }
}

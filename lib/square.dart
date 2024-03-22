import 'package:flutter/material.dart';
import 'package:kuistpm/secondpage.dart';
import 'package:kuistpm/top_global.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final Member member;
  const DetailScreen({super.key, required this.member});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member.name),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(widget.member.photoUrl),
          ),
          Text(
            widget.member.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(widget.member.dateOfBirth),
          Text(widget.member.bodyHeight.toString()),
          Text(widget.member.nickname),
          Text(widget.member.type),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedURrl('https://spada.upnyk.ac.id/');
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedURrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not Launch $_url');
    }
  }
}

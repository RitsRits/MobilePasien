import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  List<int> _ratings = [0, 0, 0];
  List<TextEditingController> _reviewControllers = List.generate(3, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildFeedbackBox(0),
              SizedBox(height: 20),
              _buildFeedbackBox(1),
              SizedBox(height: 20),
              _buildFeedbackBox(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackBox(int index) {
    return Container(
      height: 300,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.tealAccent[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.healing, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "Dokter Spesialis",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "Tanggal",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "Waktu",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text("Rating:"),
                SizedBox(width: 10),
                Row(
                  children: List.generate(5, (starIndex) {
                    return IconButton(
                      icon: Icon(
                        starIndex < _ratings[index] ? Icons.star : Icons.star_border,
                        color: Colors.yellow[700],
                      ),
                      onPressed: () {
                        setState(() {
                          _ratings[index] = starIndex + 1;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _reviewControllers[index],
              decoration: InputDecoration(
                hintText: "Write your review...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.white,
                filled: true,
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

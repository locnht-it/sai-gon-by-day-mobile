import 'package:flutter/material.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'RATING',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'TYPE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'ESTIMATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'VIA',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text('4.5', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'Open Trip',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  '3D 2N',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'Ranupane',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

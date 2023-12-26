import 'package:flutter/material.dart';

import '../../model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});
  
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {Navigator.pop(context);}, 
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
              Icon(Icons.card_giftcard, size: 100,),
              Text(cardDetail.title, style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(child: Text(cardDetail.text)),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../repositories/card_detail_repository.dart';
import '../shared/widgets/card_detail_page.dart';
import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  
  @override
  State createState() => _CardPageState();
}

class _CardPageState extends State {

  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();
  

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
          child: cardDetail == null ? const LinearProgressIndicator() : InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailPage(cardDetail: cardDetail!,)));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
              elevation: 2,
              shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.card_giftcard),
                          Text(cardDetail!.title, style: const TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(cardDetail!.text),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {}, 
                          child: const Text(
                            'Ler mais',
                            style: TextStyle(
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProductButton extends StatelessWidget {
  final int productId;

  const ShareProductButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share_outlined),
      tooltip: 'Share product',
      onPressed: () async {
        final productLink =
            'https://e-commerce-cf745.web.app/product/$productId';

        final shareMessage = 'Look at this amazing product: $productLink';

        await SharePlus.instance.share(
          ShareParams(text: shareMessage, subject: 'Check out this product!'),
        );
      },
    );
  }
}

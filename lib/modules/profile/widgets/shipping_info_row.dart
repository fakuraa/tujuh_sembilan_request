import 'package:flutter/material.dart';
import 'package:tujuh_sembilan_request/modules/profile/model/profile_info_item.dart';

class ShippingInfoRow extends StatelessWidget {
  const ShippingInfoRow({super.key});

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Cart", 3, Icons.shopping_cart_rounded),
    ProfileInfoItem("Delivery", 1, Icons.local_shipping_rounded),
    ProfileInfoItem("Receipt", 0, Icons.receipt_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            _items
                .map(
                  (item) => Expanded(
                    child: Row(
                      children: [
                        if (_items.indexOf(item) != 0) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: VerticalDivider(
                              color: Colors.blueGrey.withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                        Expanded(child: _singleItem(context, item)),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Badge(
          isLabelVisible: item.value > 0,
          child: Icon(item.icon, color: Colors.grey.withValues(alpha: 0.8)),
        ),
      ),
      Text(
        item.title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
    ],
  );
}

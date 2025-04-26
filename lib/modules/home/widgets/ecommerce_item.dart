import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EcommerceItem extends StatelessWidget {
  final bool isDiscount;
  final VoidCallback onPresed;

  const EcommerceItem({
    super.key,
    this.isDiscount = false,
    required this.onPresed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPresed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Visibility(
                visible: isDiscount,
                child: Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      "-70%",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Material(
                  color: Theme.of(context).canvasColor,
                  shape: CircleBorder(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.favorite_outline, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Keychron 65FSD Blue Switch",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: isDiscount,
                child: Row(
                  children: [
                    Text(
                      "\$435",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              Text(
                "\$224",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                    List.generate(
                      2 + Random().nextInt(5 - 1),
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 12),
                    ).toList(),
              ),
              const SizedBox(width: 4),
              Text(
                "(${3 + Random().nextInt(95 - 1)})",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.verified, size: 16, color: Colors.blue),
              const SizedBox(width: 4),
              Text(
                "The GamingGear",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

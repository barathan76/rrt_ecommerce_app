import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_stars.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onMinus,
    required this.onAdd,
  });
  final CartItem item;
  final void Function() onRemove;
  final void Function() onMinus;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              spacing: 15,
              children: [
                kOutlineContainer(
                  width: 100,
                  child: Image.network(
                    item.product.imageUrl,

                    fit: BoxFit.contain,
                    height: 100,
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 3,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        item.product.title,
                        style: mtextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Category :  ',
                            style: mtextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 2, color: Colors.white),
                              boxShadow: [greyBoxShadow],
                            ),

                            child: Text(
                              item.product.category,
                              style: mtextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${item.product.rating.rate} ',
                            style: mtextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RatingStars(
                            rating: item.product.rating.rate,
                            scale: 1,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0,
                              color: Color.fromARGB(255, 202, 202, 202),
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                        ),
                        child: Text(
                          '\$ ${(item.product.price).toStringAsFixed(2)}',
                          style: mtextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: kDividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      'Total Order (${item.count})',
                      style: mtextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    CircleIconButton(
                      icon: Icons.remove,
                      color: Colors.grey,
                      size: 12,
                      isdisabled: item.count == 1,
                      onPressed: onMinus,
                    ),
                    CircleIconButton(
                      icon: Icons.add,
                      color: Colors.grey,
                      size: 12,
                      onPressed: onAdd,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [greyBoxShadow],
                      ),
                      child: InkWell(
                        overlayColor: WidgetStatePropertyAll<Color>(
                          Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        onTap: onRemove,
                        child: Text(
                          'Remove',
                          style: mtextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Text(
                  '\$ ${(item.product.price * item.count).toStringAsFixed(2)}',
                  style: mtextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

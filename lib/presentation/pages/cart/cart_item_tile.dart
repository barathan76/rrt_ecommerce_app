import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/circle_icon_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/rating_stars.dart';

class CartItemTile extends StatefulWidget {
  const CartItemTile({super.key, required this.item, required this.onRemove});
  final CartItem item;
  final void Function() onRemove;

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              spacing: 15,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Color.fromARGB(255, 202, 202, 202),
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Image.network(
                    widget.item.product.imageUrl,

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
                        widget.item.product.title,
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
                              boxShadow: [
                                BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Color.fromARGB(255, 202, 202, 202),
                                ),
                              ],
                            ),

                            child: Text(
                              widget.item.product.category,
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
                            '${widget.item.product.rating.rate} ',
                            style: mtextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RatingStars(
                            rating: widget.item.product.rating.rate,
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
                          '\$ ${(widget.item.product.price).toStringAsFixed(2)}',
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
            Divider(color: Color.fromARGB(255, 187, 187, 187)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      'Total Order (${widget.item.count})',
                      style: mtextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    CircleIconButton(
                      icon: Icons.remove,
                      color: Colors.grey,
                      size: 12,
                      isdisabled: widget.item.count == 1,
                      onPressed: () {
                        setState(() {
                          widget.item.count--;
                        });
                      },
                    ),
                    CircleIconButton(
                      icon: Icons.add,
                      color: Colors.grey,
                      size: 12,
                      onPressed: () {
                        setState(() {
                          widget.item.count++;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Color.fromARGB(255, 202, 202, 202),
                          ),
                        ],
                      ),
                      child: InkWell(
                        overlayColor: WidgetStatePropertyAll<Color>(
                          Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        onTap: widget.onRemove,
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
                  '\$ ${(widget.item.product.price * widget.item.count).toStringAsFixed(2)}',
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

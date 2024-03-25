import 'package:ecommerceapp/detailspage/presentation/details_page.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
//final GetAllProductsModel productModel;
  final String image;
  final String rate;
  final String price;
  final String title;
  const CustomItem({
    super.key,
    required this.image,
    required this.rate,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const DetailsPage();
          }),
        );
      },
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 6,
                    top: 8,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white.withOpacity(.5),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(title),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(rate),
                    ],
                  ),
                  Text('\$$price')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_apps/pages/detail_page.dart';
import 'package:restaurant_apps/theme.dart';

import '../data/model/resto_model.dart';

class RestoTile extends StatelessWidget {
  const RestoTile({
    Key? key,
    required this.resto,
  }) : super(key: key);
  final RestoModel resto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(
            resto: resto,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(defautMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                resto.pictureId,
                width: 100,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resto.name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          resto.city,
                          style: secondaryTextStyale.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(resto.rating.toString(), style: secondaryTextStyale),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

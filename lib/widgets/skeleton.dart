import 'package:flutter/material.dart';

import '../theme.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(defautMargin),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 176, 175, 179).withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}

class NewSkeleton extends StatelessWidget {
  const NewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defautMargin),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton(
            width: 100,
            height: 75,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(
                  width: 100,
                  height: 20,
                ),
                SizedBox(height: 10),
                Skeleton(
                  width: 70,
                  height: 20,
                ),
                SizedBox(height: 10),
                Skeleton(
                  width: 50,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

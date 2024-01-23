import 'package:flutter/material.dart';

class PopularItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                )),
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/crime.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/parasite.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/straw.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/toy.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/mia.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/avengers.png",
                          ),
                        ),
                      ],
                    )),
              ),
              //single item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                    width: 140,
                    height: 195,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.dstATop,
                          ),
                          child: Image.asset(
                            "images/frozen.png",
                          ),
                        ),
                      ],
                    )),
              )
            ]),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailPage(this.heroTag, this.foodName, this.foodPrice);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  var selectedCard = "WEIGHT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Details",
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 82,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  )),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.heroTag), fit: BoxFit.cover),
                    ),
                  ),
                ),
                height: 200,
                width: 200,
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodName,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.foodPrice,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              color: Colors.grey),
                        ),
                        Container(
                          height: 25,
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.deepPurpleAccent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.cyan),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.cyan),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildIfoCard("high", "info", "unit"),
                          SizedBox(width: 10,),
                          _buildIfoCard("low", "info", "unit"),
                          SizedBox(width: 10,),
                          _buildIfoCard("medium", "info", "unit"),
                          SizedBox(width: 10,),
                          _buildIfoCard("core", "info", "unit"),
                          SizedBox(width: 10,),
                          _buildIfoCard("title", "info", "unit"),
                          SizedBox(width: 10,),
                          _buildIfoCard("title", "info", "unit"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        SelectedCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75,
          ),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color:
                      cardTitle == selectedCard ? Colors.white : Colors.black),
            ),
            Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color:
                      cardTitle == selectedCard ? Colors.white : Colors.black),
                ),
                Text(
                  unit,
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color:
                      cardTitle == selectedCard ? Colors.white : Colors.black),
                ),
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }

  SelectedCard(cardTitle) {
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:ntt_travel/pages/detail.dart';
import 'package:ntt_travel/utils/var_global.dart';

class Search extends StatefulWidget {
  final String title;

  const Search({super.key, required this.title});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var indexDataSearch;
  var data;
  void search() {
    indexDataSearch =
        VarGlobal.data.indexWhere((e) => e['title'] == widget.title);
    data = VarGlobal.data[indexDataSearch]['title'];
    print(data);
  }

  @override
  void initState() {
    search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.all(25),
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      img: VarGlobal.data[indexDataSearch]['img'],
                      title: VarGlobal.data[indexDataSearch]['title'],
                      deskripsi: VarGlobal.data[indexDataSearch]['deskripsi'],
                      harga: VarGlobal.data[indexDataSearch]['harga'],
                      data_ulasan: VarGlobal.data[indexDataSearch]['ulasan'],
                    ),
                  ));
            },
            child: Container(
              height: 330,
              width: 200,
              margin: EdgeInsets.only(bottom: 20),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.5),
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        VarGlobal.data[indexDataSearch]['img'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          VarGlobal.data[indexDataSearch]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          VarGlobal.data[indexDataSearch]['deskripsi'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            VarGlobal.data[indexDataSearch]['harga'],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:covid19/controller/countryController/countryProvider.dart';
import 'package:covid19/pages/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  TextEditingController scearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CountryControllers countryControllers = CountryControllers();
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 90,
          backgroundColor: const Color.fromARGB(255, 113, 157, 240),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report of Countries',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          elevation: 0,
          actions: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromARGB(255, 243, 33, 33),
                      child: Text("1"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, top: 5, bottom: 5),
              child: Container(
                height: size.height / 18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: scearchController,
                  decoration: InputDecoration(
                    hintText: 'Search With Country Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 113, 157, 240),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 200,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                  left: 15,
                ),
                child: FutureBuilder(
                    future: countryControllers.getCountries(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade600,
                                highlightColor: Colors.grey.shade600,
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    height: 50,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]["country"];

                              if (scearchController.text.isEmpty) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsPage(
                                                name: snapshot.data![index]
                                                    ["country"],
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                chase: snapshot.data![index]
                                                    ["cases"].toString(),
                                                recover: snapshot.data![index]
                                                    ["recovered"].toString(),
                                                deth: snapshot.data![index]
                                                    ["deaths"].toString())));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]["countryInfo"]
                                                ["flag"])),
                                    title: Text(
                                      snapshot.data![index]["country"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]["cases"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15),
                                  ),
                                );
                              } else if (name.toLowerCase().contains(
                                  scearchController.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  DetailsPage(
                                        name: snapshot.data![index]["country"],
                                        image: snapshot.data![index]
                                            ["countryInfo"]["flag"],
                                        chase: snapshot.data![index]["cases"].toString(),
                                        recover: snapshot.data![index]
                                            ["recovered"].toString(),
                                        deth: snapshot.data![index]["deaths"].toString())));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]["countryInfo"]
                                                ["flag"])),
                                    title: Text(
                                      snapshot.data![index]["country"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]["cases"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}

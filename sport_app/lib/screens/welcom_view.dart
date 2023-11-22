import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/screens/home_view.dart';

class WelcomView extends StatefulWidget {
  @override
  _WelcomViewState createState() => _WelcomViewState();
}

class _WelcomViewState extends State<WelcomView> {
  final List levels = [
    "Inactif",
    "Débutant",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    "LA VEINE  ",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.white,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    "DU BIBI",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Color(0xFF40D876),
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A propos de toi",
                    style: GoogleFonts.lato(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "nous voulons en savoir plus sur toi, complete les informations",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      height: 226,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: levels.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 226,
                              width: 195,
                              decoration: BoxDecoration(
                                color: Color(0xFF232441),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Je suis",
                                      style: GoogleFonts.lato(
                                        fontSize: 30,
                                        color: Color(0xFF40D876),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      levels[index],
                                      style: GoogleFonts.lato(
                                        fontSize: 30,
                                        color: Color(0xFF40D876),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "Je n'ai pas fait de sport depuis longtemps",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40.0, top: 40, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Passer l'intro",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          },
                          child: Container(
                            width: 139,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Color(0xFF40D876),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                "Suivant",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

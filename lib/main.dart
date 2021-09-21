import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_calculator_app_ui/logics.dart';
import 'package:loan_calculator_app_ui/result_display_widget.dart';
import 'package:loan_calculator_app_ui/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Logic _logic;
  late double _interest;
  late double _totalLoan;
  late double _monthlyRate;
  //double monthSlider = 24;
  //double loanSlider = _logic.loanAmount;
  double creditSlider = 740;

  @override
  void initState() {
    _logic = new Logic();
    _interest = _logic.interest;
    _totalLoan = _logic.totalLoan();
    _monthlyRate = _logic.monthlyRate();

    _logic.addListener(() {
      setState(() {
        _interest = _logic.interest;
        _totalLoan = _logic.totalLoan();
        _monthlyRate = _logic.monthlyRate();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 24),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [gradientDark, gradientLight],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Loan Calculator",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    ResultDisplay(
                      interest: _interest,
                      totalLoan: _totalLoan,
                      monthlyPayment: _monthlyRate,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Loan Amount",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      "\$${_logic.loanAmount.toStringAsFixed(0)}",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Slider(
                    onChanged: (value) {
                      //loanSlider = value;
                      setState(() {
                        _logic.loanAmount = value;
                      });
                    },
                    value: _logic.loanAmount,
                    min: 3000,
                    max: 20000,
                    divisions: 1000,
                    activeColor: gradientLight,
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    leading: Text("-      \$3000",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    trailing: Text(
                      "\$12000",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Text(
                    "Interested in different amount?",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                  ListTile(
                    leading: Text(
                      "Loan Term",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      "${_logic.loanTerms.toStringAsFixed(0)}",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Slider(
                    onChanged: (value) {
                      setState(() {
                        //monthSlider = value;
                        _logic.loanTerms = value;
                      });
                    },
                    value: _logic.loanTerms,
                    min: 0,
                    max: 60,
                    divisions: 5,
                    activeColor: gradientLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "12",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "24",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "36",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "48",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "60",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Wrap(
                      children: [
                        Text(
                          "Fico Credit Store",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                    trailing: Text(
                      "${creditSlider.toStringAsFixed(0)}",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Slider(
                    onChanged: (value) {
                      setState(() {
                        creditSlider = value;
                      });
                    },
                    value: creditSlider,
                    min: 520,
                    max: 801,
                    activeColor: gradientLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "<580",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "580",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "670",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "740",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "800",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      print(12.plus(6));
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          "Start Your Application",
                          style: GoogleFonts.lato(
                            color: gradientDark,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

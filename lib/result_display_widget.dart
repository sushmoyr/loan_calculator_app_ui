import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_calculator_app_ui/utils.dart';

class ResultDisplay extends StatelessWidget {
  final double monthlyPayment;
  final double totalLoan;
  final double interest;
  const ResultDisplay(
      {Key? key,
      required this.monthlyPayment,
      required this.totalLoan,
      required this.interest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      elevation: 16,
      color: surfaceColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "\$${monthlyPayment.toStringAsFixed(2)}",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 40),
            ),
            Text(
              "Est. Monthly Payment",
              style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Est Interest Rate",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "$interest%",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Est. Cost of Loan",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "\$${totalLoan.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

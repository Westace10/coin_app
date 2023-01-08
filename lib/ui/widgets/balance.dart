import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key, this.heading}) : super(key: key);
  final String? heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetsHorizontalNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading!,
            style: GoogleFonts.familjenGrotesk(
              fontWeight: FontWeight.w400,
              fontSize: 12.5,
              height: 1.5,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\u00240.00",
                style: GoogleFonts.familjenGrotesk(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  height: 1.5,
                ),
              ),
              Padding(
                padding: kEdgeInsetsAllSmall,
                child: const Icon(
                  Icons.visibility_off,
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

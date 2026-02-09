import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';

class TypeOrderChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SfCircularChart(
              series: <CircularSeries>[
                RadialBarSeries<ChartData, String>(
                  dataSource: [ChartData('A', 70)],
                  xValueMapper: (data, _) => data.label,
                  yValueMapper: (data, _) => data.value,
                  maximumValue: 100,
                  radius: '90%',
                  innerRadius: '75%',
                  trackColor: bgColor,
                  trackBorderWidth: 1,
                  pointColorMapper: (_, __) => yellowPrimaryColor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                RadialBarSeries<ChartData, String>(
                  dataSource: [ChartData('B', 50)],
                  xValueMapper: (data, _) => data.label,
                  yValueMapper: (data, _) => data.value,
                  maximumValue: 100,
                  radius: '70%',
                  innerRadius: '55%',
                  trackColor: bgsecondColor,
                  trackBorderWidth: 1,
                  pointColorMapper: (_, __) => yellowSecondColor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                RadialBarSeries<ChartData, String>(
                  dataSource: [ChartData('C', 90)],
                  xValueMapper: (data, _) => data.label,
                  yValueMapper: (data, _) => data.value,
                  maximumValue: 100,
                  radius: '50%',
                  innerRadius: '35%',
                  trackBorderWidth: 1,
                  trackColor: bgColor,
                  pointColorMapper: (_, __) => yellowGrafic,
                  cornerStyle: CornerStyle.bothCurve,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: yellowPrimaryColor,
                      radius: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "200 Customer",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: yellowPrimaryColor,
                      radius: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To GO",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "200 Customer",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundColor: yellowSecondColor, radius: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dine In",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "200 Customer",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.label, this.value);
  final String label;
  final double value;
}

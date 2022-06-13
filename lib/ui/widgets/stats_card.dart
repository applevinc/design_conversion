import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets/images.dart';
import 'package:flutter_application_1/core/constants/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalSpace),
      padding: EdgeInsets.symmetric(
        vertical: verticalSpace,
        horizontal: horizontalSpace,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBBC1C7)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Appointment',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 13.sp,
                ),
          ),
          Row(
            children: [
              Text(
                'N5,000',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
              ),
              SizedBox(width: 5.w),
              Image.asset(AppImages.arrow),
              Text(
                '70%',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color(0xff079300),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
          SizedBox(height: gap),
          const _ChartView2(),
          SizedBox(height: gap),
          const _SummaryTile(label: 'Total appointment'),
          SizedBox(height: gap),
          const _SummaryTile(label: 'Accepted'),
          SizedBox(height: gap),
          const _SummaryTile(label: 'Completed'),
          SizedBox(height: gap),
          const _SummaryTile(label: 'Decline'),
        ],
      ),
    );
  }
}

class _Data {
  _Data(this.day, this.sales);

  final int day;
  final double sales;
}

class _ChartView2 extends StatefulWidget {
  const _ChartView2({Key? key}) : super(key: key);

  @override
  State<_ChartView2> createState() => _ChartView2State();
}

class _ChartView2State extends State<_ChartView2> {
  List<_Data> data = [
    _Data(21, 0),
    _Data(22, 21),
    _Data(23, 31),
    _Data(24, 0),
    _Data(25, 10),
    _Data(26, 2),
  ];
  final gradientColors = LinearGradient(
    begin: Alignment.topLeft,
    end: const Alignment(0.8, 1),
    colors: <Color>[
      const Color(0xff1C71B7).withOpacity(.2),
      const Color(0xff1C71B7).withOpacity(.1),
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(title: AxisTitle(text: 'April')),
        primaryYAxis: NumericAxis(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<_Data, int>>[
          LineSeries<_Data, int>(
            dataSource: data,
            xValueMapper: (_Data sales, _) => sales.day,
            yValueMapper: (_Data sales, _) => sales.sales,
            //gradient: gradientColors,
            markerSettings: const MarkerSettings(
              isVisible: true,
              // Marker shape is set to diamond
              shape: DataMarkerType.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartView extends StatelessWidget {
  const _ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradientColors = LinearGradient(
      begin: Alignment.topLeft,
      end: const Alignment(0.8, 1),
      colors: <Color>[
        const Color(0xff1C71B7).withOpacity(.2),
        const Color(0xff1C71B7).withOpacity(.1),
      ], // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    );
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 30.h,
      width: size.width,
      child: LineChart(
        LineChartData(
          minX: 21,
          maxX: 26,
          minY: 0,
          maxY: 6,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: false,
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(21, 0),
                const FlSpot(22, 2),
                const FlSpot(23, 4),
                const FlSpot(24, 0),
                const FlSpot(25, 1),
                const FlSpot(26, 0.3),
              ],
              show: true,
              gradient: gradientColors,
              barWidth: 0,
              belowBarData: BarAreaData(
                show: true,
                gradient: gradientColors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const _Dot(),
            SizedBox(width: 4.w),
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 13.sp,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '3',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  ),
            ),
            SizedBox(width: 5.w),
            Image.asset(AppImages.arrow),
            Text(
              '70%',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xff079300),
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
            ),
          ],
        )
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 6.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff1C71B7),
      ),
    );
  }
}

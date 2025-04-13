import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatChart extends StatefulWidget {
  const StatChart({super.key});
  @override
  State<StatChart> createState() => _StatChartState();
}

class _StatChartState extends State<StatChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(180, 144, 147, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Over  All Performance\nThe Years",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 175,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 28,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        final years = [2015, 2016, 2017, 2018, 2019, 2020];
                        if (value.toInt() >= 0 &&
                            value.toInt() < years.length) {
                          return Text(
                            years[value.toInt()].toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  _buildLine(
                    color: const Color(0xFFB66E8B),
                    spots: [30, 35, 5, 35, 15, 40],
                  ),
                  _buildLine(
                    color: const Color(0xFF4339F2),
                    spots: [20, 25, 10, 40, 20, 30],
                    showDotAtIndex: 3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Indicator(color: Color(0xFFB66E8B), text: "Pending Done"),
              SizedBox(width: 20),
              Indicator(color: Color(0xFF4339F2), text: "Project Done"),
            ],
          ),
        ],
      ),
    );
  }

  LineChartBarData _buildLine({
    required Color color,
    required List<double> spots,
    int? showDotAtIndex,
  }) {
    return LineChartBarData(
      isCurved: true,
      barWidth: 4,
      dotData: FlDotData(
        show: showDotAtIndex != null,
        getDotPainter: (spot, percent, barData, index) {
          if (index == showDotAtIndex) {
            return FlDotCirclePainter(
              radius: 6,
              color: Colors.white,
              strokeColor: color,
              strokeWidth: 4,
            );
          }
          return FlDotCirclePainter(radius: 0); // no dots for others
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [color.withOpacity(0.3), color.withOpacity(0.05)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      gradient: LinearGradient(
        colors: [color.withOpacity(0.8), color],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      spots: List.generate(
        spots.length,
        (index) => FlSpot(index.toDouble(), spots[index]),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

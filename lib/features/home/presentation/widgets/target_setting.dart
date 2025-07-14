import 'package:flutter/material.dart';

class TargetItem {
  final String title;
  final String unit;
  final double value;
  final double minValue;
  final double maxValue;
  final IconData icon;

  TargetItem({
    required this.title,
    required this.unit,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.icon,
  });
}

class TargetSettingWidget extends StatefulWidget {
  final List<TargetItem> targetItems;
  final Function(List<TargetItem>) onApply;
  final VoidCallback? onCancel;
  final Color primaryColor;
  final Color backgroundColor;

  const TargetSettingWidget({
    Key? key,
    required this.targetItems,
    required this.onApply,
    this.onCancel,
    this.primaryColor = const Color(0xFF6B46C1),
    this.backgroundColor = const Color(0xFFF3F4F6),
  }) : super(key: key);

  @override
  State<TargetSettingWidget> createState() => _TargetSettingWidgetState();
}

class _TargetSettingWidgetState extends State<TargetSettingWidget> {
  int selectedIndex = 0;
  late List<TargetItem> currentTargets;

  @override
  void initState() {
    super.initState();
    currentTargets = widget.targetItems.map((item) => TargetItem(
      title: item.title,
      unit: item.unit,
      value: item.value,
      minValue: item.minValue,
      maxValue: item.maxValue,
      icon: item.icon,
    )).toList();
  }

  void _updateTargetValue(double value) {
    setState(() {
      currentTargets[selectedIndex] = TargetItem(
        title: currentTargets[selectedIndex].title,
        unit: currentTargets[selectedIndex].unit,
        value: value,
        minValue: currentTargets[selectedIndex].minValue,
        maxValue: currentTargets[selectedIndex].maxValue,
        icon: currentTargets[selectedIndex].icon,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with number indicator
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: widget.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Chip selector
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: List.generate(
                currentTargets.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: selectedIndex == index
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            currentTargets[index].icon,
                            size: 20,
                            color: selectedIndex == index
                                ? widget.primaryColor
                                : Colors.grey[600],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currentTargets[index].title,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: selectedIndex == index
                                  ? widget.primaryColor
                                  : Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          
          // Navigation arrows and slider
          Row(
            children: [
              // Left arrow
              GestureDetector(
                onTap: selectedIndex > 0
                    ? () {
                        setState(() {
                          selectedIndex--;
                        });
                      }
                    : null,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: selectedIndex > 0
                        ? widget.primaryColor
                        : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: selectedIndex > 0
                        ? Colors.white
                        : Colors.grey[500],
                  ),
                ),
              ),
              
              // Slider
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Current value display
                      Text(
                        '${currentTargets[selectedIndex].value.toStringAsFixed(currentTargets[selectedIndex].value % 1 == 0 ? 0 : 1)} ${currentTargets[selectedIndex].unit}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: widget.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Slider
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: widget.primaryColor,
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: widget.primaryColor,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                          overlayShape: SliderComponentShape.noOverlay,
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: currentTargets[selectedIndex].value,
                          min: currentTargets[selectedIndex].minValue,
                          max: currentTargets[selectedIndex].maxValue,
                          onChanged: _updateTargetValue,
                        ),
                      ),
                      
                      // Min and max labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${currentTargets[selectedIndex].minValue.toStringAsFixed(0)} ${currentTargets[selectedIndex].unit}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '${currentTargets[selectedIndex].maxValue.toStringAsFixed(0)} ${currentTargets[selectedIndex].unit}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Right arrow
              GestureDetector(
                onTap: selectedIndex < currentTargets.length - 1
                    ? () {
                        setState(() {
                          selectedIndex++;
                        });
                      }
                    : null,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: selectedIndex < currentTargets.length - 1
                        ? widget.primaryColor
                        : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: selectedIndex < currentTargets.length - 1
                        ? Colors.white
                        : Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => widget.onApply(currentTargets),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: widget.onCancel,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Example usage widget
class TargetSettingExample extends StatefulWidget {
  @override
  _TargetSettingExampleState createState() => _TargetSettingExampleState();
}

class _TargetSettingExampleState extends State<TargetSettingExample> {
  List<TargetItem> targets = [
    TargetItem(
      title: 'Steps',
      unit: 'steps',
      value: 8000,
      minValue: 1000,
      maxValue: 20000,
      icon: Icons.directions_walk,
    ),
    TargetItem(
      title: 'Sleep',
      unit: 'hours',
      value: 7.5,
      minValue: 4.0,
      maxValue: 12.0,
      icon: Icons.bedtime,
    ),
    TargetItem(
      title: 'Calories',
      unit: 'kcal',
      value: 2000,
      minValue: 1000,
      maxValue: 4000,
      icon: Icons.local_fire_department,
    ),
    TargetItem(
      title: 'Water',
      unit: 'liters',
      value: 2.5,
      minValue: 1.0,
      maxValue: 5.0,
      icon: Icons.water_drop,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Target Setting Example'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TargetSettingWidget(
            targetItems: targets,
            onApply: (updatedTargets) {
              setState(() {
                targets = updatedTargets;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Targets updated successfully!'),
                ),
              );
            },
            onCancel: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cancelled'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
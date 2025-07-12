import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_event.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_state.dart';
import 'package:fitness_tracker/features/auth/presentation/pages/signin_page.dart';
import 'package:fitness_tracker/features/home/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(authBloc: context.read<AuthBloc>())..add(GetUserData()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.pushReplacement( '/signin');
            // context.go('/signin');
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SignInPage()),
            //   (route) => false,
            // );
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xFFF8F9FA),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(),
                  SizedBox(height: 20),
                  BMIWidget(),
                  SizedBox(height: 20),
                  TodayTargetWidget(),
                  SizedBox(height: 20),
                  ActivityStatusWidget(),
                  SizedBox(height: 20),
                  StatsRowWidget(),
                  SizedBox(height: 20),
                  WorkoutProgressWidget(),
                  SizedBox(height: 20),
                  LatestWorkoutWidget(),
                  SizedBox(height: 100), // Space for bottom navigation
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationWidget(),
        ),
      ),
    );
  }
}


class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoaded) {
          print(state.user.email);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back,',
                    style: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF)),
                  ),
                  Text(
                    state.user.email,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF6B7280),
                  size: 24,
                ),
              ),
            ],
          );
        }else if(state is DashboardError){
          return Text(state.message);
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class BMIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppPallete.primaryColor, AppPallete.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BMI (Body Mass Index)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'You have a normal weight',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFE879F9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                
                CircularProgressIndicator(
                  value: 0.7,
                  strokeWidth: 10,
                  strokeCap: StrokeCap.round,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE879F9)),
                ),
                Center(
                  child: Text(
                    '20.1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TodayTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today Target',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF7FB3FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Check',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity Status',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heart Rate',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE879F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '3mins ago',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '78 BPM',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7FB3FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                child: CustomPaint(
                  painter: HeartRateChartPainter(),
                  size: Size(double.infinity, 60),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatsRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Water Intake',
            value: '4 Liters',
            subtitle: 'Real time updates',
            progress: 0.6,
            color: Color(0xFF7FB3FF),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              StatsCard(
                title: 'Sleep',
                value: '8h 20m',
                subtitle: '',
                progress: 0.8,
                color: Color(0xFF9FC5FF),
              ),
              SizedBox(height: 16),
              StatsCard(
                title: 'Calories',
                value: '760 kCal',
                subtitle: '230kcal left',
                progress: 0.75,
                color: Color(0xFF7FB3FF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final double progress;
  final Color color;

  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.progress,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
          ],
          SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }
}

class WorkoutProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Workout Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFF7FB3FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    'Weekly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fri, 28 May',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      Text(
                        'Upperbody Workout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7FB3FF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 120,
                child: CustomPaint(
                  painter: WorkoutChartPainter(),
                  size: Size(double.infinity, 120),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                    .map(
                      (day) => Text(
                        day,
                        style: TextStyle(
                          fontSize: 12,
                          color: day == 'Fri'
                              ? Color(0xFF7FB3FF)
                              : Color(0xFF9CA3AF),
                          fontWeight: day == 'Fri'
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LatestWorkoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Workout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            Text(
              'See more',
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
            ),
          ],
        ),
        SizedBox(height: 16),
        WorkoutCard(
          title: 'Fullbody Workout',
          calories: '180 Calories Burn',
          duration: '20minutes',
          color: Color(0xFF7FB3FF),
          icon: Icons.fitness_center,
        ),
        SizedBox(height: 12),
        WorkoutCard(
          title: 'Lowerbody Workout',
          calories: '200 Calories Burn',
          duration: '30minutes',
          color: Color(0xFF8B9BFF),
          icon: Icons.directions_run,
        ),
        SizedBox(height: 12),
        WorkoutCard(
          title: 'AB Workout',
          calories: '180 Calories Burn',
          duration: '20minutes',
          color: Color(0xFFE879F9),
          icon: Icons.accessibility_new,
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String calories;
  final String duration;
  final Color color;
  final IconData icon;

  const WorkoutCard({
    Key? key,
    required this.title,
    required this.calories,
    required this.duration,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$calories | $duration',
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF6B7280),
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Color(0xFF6B7280)),
          Icon(Icons.calendar_today, color: Color(0xFF6B7280)),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF7FB3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
          Icon(Icons.camera_alt, color: Color(0xFF6B7280)),
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF6B7280)),
            onPressed: () {
              context.read<AuthBloc>().add(SignOutEvent());
            },
          ),
        ],
      ),
    );
  }
}

class HeartRateChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF7FB3FF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double width = size.width;
    double height = size.height;

    // Create a simple heart rate pattern
    path.moveTo(0, height * 0.5);
    for (int i = 0; i < width.toInt(); i += 20) {
      path.lineTo(
        i.toDouble(),
        height * 0.5 + math.sin(i * 0.1) * height * 0.3,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WorkoutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF7FB3FF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double width = size.width;
    double height = size.height;

    // Create a workout progress chart
    List<double> values = [0.2, 0.4, 0.6, 0.8, 0.5, 1.0, 0.7];

    for (int i = 0; i < values.length; i++) {
      double x = (i / (values.length - 1)) * width;
      double y = height - (values[i] * height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
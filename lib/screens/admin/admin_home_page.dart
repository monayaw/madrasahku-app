
import 'package:flutter/material.dart';

import '../../utilis/app_colors.dart';
import '../../utilis/app_text_style.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header admin
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E7EB),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assalamu’alaikum,',
                          style: AppTextStyle.bodySmall,
                        ),
                        Text(
                          'Admin',
                          style: AppTextStyle.headingSmall,
                        ),
                        Text(
                          'Operator Madrasah',
                          style: AppTextStyle.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Menu notifikasi belum tersedia'),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Banner utama
              Container(
                width: double.infinity,
                height: 154,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF35C979),
                      Color(0xFF4ADE80),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 17,
                      right: 12,
                      child: Text(
                        'Kelola madrasah dengan mudah,\n'
                        'semua dalam satu aplikasi. ✨',
                        style: AppTextStyle.headingSmall.copyWith(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),

                   
 

                     // Gambar masjid di atas bukit
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                  'assets/image/masjid.png',
                    height: 127,
                    fit: BoxFit.contain,
                     alignment: Alignment.bottomCenter,
                  ),
                 ),

                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Menu utama
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 0.95,
                children: [
                  _MenuItem(
                    title: 'Data Guru',
                    icon: Icons.person,
                    color: const Color(0xFF219653),
                    onTap: () => _showComingSoon(context, 'Data Guru'),
                  ),
                  _MenuItem(
                    title: 'Data Siswa',
                    icon: Icons.person,
                    color: const Color(0xFF60A5FA),
                    onTap: () => _showComingSoon(context, 'Data Siswa'),
                  ),
                  _MenuItem(
                    title: 'Data Kelas',
                    icon: Icons.description,
                    color: const Color(0xFF219653),
                    onTap: () => _showComingSoon(context, 'Data Kelas'),
                  ),
                  _MenuItem(
                    title: 'Mata Pelajaran',
                    icon: Icons.assignment_outlined,
                    color: const Color(0xFF219653),
                    onTap: () =>
                        _showComingSoon(context, 'Mata Pelajaran'),
                  ),
                  _MenuItem(
                    title: 'Jadwal',
                    icon: Icons.calendar_month_outlined,
                    color: const Color(0xFF60A5FA),
                    onTap: () => _showComingSoon(context, 'Jadwal'),
                  ),
                  _MenuItem(
                    title: 'Pengumuman',
                    icon: Icons.campaign_outlined,
                    color: const Color(0xFF60A5FA),
                    onTap: () => _showComingSoon(context, 'Pengumuman'),
                  ),
                  _MenuItem(
                    title: 'Lainnya',
                    icon: Icons.more_horiz,
                    color: const Color(0xFF219653),
                    onTap: () => _showComingSoon(context, 'Lainnya'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showComingSoon(BuildContext context, String menu) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$menu akan kita buat berikutnya, ya!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 40,
              color: color,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.bodySmall.copyWith(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _HillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final greenHill = Paint()
      ..color = const Color(0xFF219653);

    final yellowHill = Paint()
      ..color = const Color(0xFFF4C65B);

    final orangeHill = Paint()
      ..color = const Color(0xFFE9A23B);

    final greenPath = Path()
      ..moveTo(0, 18)
      ..quadraticBezierTo(
        size.width * 0.20,
        size.height * 0.65,
        size.width * 0.42,
        size.height * 0.42,
      )
      ..quadraticBezierTo(
        size.width * 0.65,
        size.height * 0.18,
        size.width,
        size.height * 0.55,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(greenPath, greenHill);

    final yellowPath = Path()
      ..moveTo(0, size.height * 0.68)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.12,
        size.width * 0.50,
        size.height * 0.62,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.18,
        size.width,
        size.height * 0.64,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(yellowPath, yellowHill);

    final orangePath = Path()
      ..moveTo(0, size.height * 0.83)
      ..quadraticBezierTo(
        size.width * 0.30,
        size.height * 0.50,
        size.width * 0.56,
        size.height * 0.76,
      )
      ..quadraticBezierTo(
        size.width * 0.80,
        size.height * 0.48,
        size.width,
        size.height * 0.80,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(orangePath, orangeHill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

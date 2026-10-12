import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/energy_item.dart';
import '../widgets/energy_card.dart';
import '../widgets/header_section.dart';
import '../widgets/location_card.dart';
import '../widgets/page_indicator.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.88);
  final List<EnergyItem> _daftarEnergi = EnergyItem.getDummyData();

  int _halamanAktif = 0;
  double _skala = 1.0;
  double _skalaAwal = 1.0;

  int get _totalKapasitas {
    return _daftarEnergi
        .where((item) => item.aktif)
        .fold<int>(0, (sum, item) => sum + item.kapasitasMw.toInt());
  }

  double get _rataRataEfisiensi {
    final terpilih = _daftarEnergi.where((item) => item.aktif).toList();
    if (terpilih.isEmpty) return 0.0;
    final total = terpilih.fold<double>(0.0, (sum, item) => sum + item.efisiensiPersen);
    return total / terpilih.length;
  }

  String _formatKapasitas(int total) {
    if (total == 0) return '0 MW';
    if (total >= 1000) {
      final s = total.toString();
      return '${s.substring(0, s.length - 3)}.${s.substring(s.length - 3)} MW';
    }
    return '$total MW';
  }

  String _formatEfisiensi(double efisiensi) {
    if (efisiensi == 0.0) return '0%';
    if (efisiensi % 1 == 0) {
      return '${efisiensi.toInt()}%';
    }
    return '${efisiensi.toStringAsFixed(1)}%';
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSection(),
                const SizedBox(height: 20),
                SummaryCard(
                  totalKapasitas: _formatKapasitas(_totalKapasitas),
                  rataRataEfisiensi: _formatEfisiensi(_rataRataEfisiensi),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Katalog Sumber Daya',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      Text(
                        '${_halamanAktif + 1} dari ${_daftarEnergi.length}',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onScaleStart: (details) {
                    _skalaAwal = _skala;
                  },
                  onScaleUpdate: (details) {
                    setState(() {
                      _skala = (_skalaAwal * details.scale).clamp(0.85, 1.25);
                    });
                  },
                  child: Transform.scale(
                    scale: _skala,
                    child: SizedBox(
                      height: 390,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _daftarEnergi.length,
                        onPageChanged: (index) {
                          setState(() {
                            _halamanAktif = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final data = _daftarEnergi[index];
                          return EnergyCard(
                            item: data,
                            onDoubleTap: () {
                              setState(() {
                                data.aktif = !data.aktif;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                PageIndicator(
                  count: _daftarEnergi.length,
                  currentIndex: _halamanAktif,
                ),
                const SizedBox(height: 24),
                LocationCard(
                  item: _daftarEnergi[_halamanAktif],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

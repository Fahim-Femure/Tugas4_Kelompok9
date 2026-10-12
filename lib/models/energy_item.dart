class EnergyItem {
  final String nama;
  final String kategori;
  final double kapasitasMw;
  final double efisiensiPersen;
  final String lokasi;
  final String gambar;
  bool aktif;

  EnergyItem({
    required this.nama,
    required this.kategori,
    required this.kapasitasMw,
    required this.efisiensiPersen,
    required this.lokasi,
    required this.gambar,
    this.aktif = false,
  });

  String get kapasitas => '${kapasitasMw.toInt()} MW';
  String get efisiensi => '${efisiensiPersen.toInt()}%';

  static List<EnergyItem> getDummyData() {
    return [
      EnergyItem(
        nama: 'Tenaga Surya',
        kategori: 'Solar Photovoltaic',
        kapasitasMw: 450,
        efisiensiPersen: 92,
        lokasi: 'Cirata, Jawa Barat',
        gambar: 'assets/images/solar.png',
      ),
      EnergyItem(
        nama: 'Tenaga Angin',
        kategori: 'Wind Turbine Farm',
        kapasitasMw: 320,
        efisiensiPersen: 88,
        lokasi: 'Sidrap, Sulawesi Selatan',
        gambar: 'assets/images/wind.png',
      ),
      EnergyItem(
        nama: 'Pembangkit Air',
        kategori: 'Hydroelectric Power',
        kapasitasMw: 680,
        efisiensiPersen: 95,
        lokasi: 'Jatiluhur, Jawa Barat',
        gambar: 'assets/images/hydro.png',
      ),
      EnergyItem(
        nama: 'Biomassa',
        kategori: 'Bioenergy System',
        kapasitasMw: 210,
        efisiensiPersen: 84,
        lokasi: 'Pelalawan, Riau',
        gambar: 'assets/images/biomassa.png',
      ),
      EnergyItem(
        nama: 'Panas Bumi',
        kategori: 'Geothermal Plant',
        kapasitasMw: 540,
        efisiensiPersen: 90,
        lokasi: 'Kamojang, Jawa Barat',
        gambar: 'assets/images/geothermal.png',
      ),
    ];
  }
}

class EnergyItem {
  final String nama;
  final String kategori;
  final String kapasitas;
  final String efisiensi;
  final String lokasi;
  final String gambar;
  bool aktif;

  EnergyItem({
    required this.nama,
    required this.kategori,
    required this.kapasitas,
    required this.efisiensi,
    required this.lokasi,
    required this.gambar,
    this.aktif = false,
  });

  static List<EnergyItem> getDummyData() {
    return [
      EnergyItem(
        nama: 'Tenaga Surya',
        kategori: 'Solar Photovoltaic',
        kapasitas: '450 MW',
        efisiensi: '92%',
        lokasi: 'Cirata, Jawa Barat',
        gambar: 'assets/images/solar.png',
      ),
      EnergyItem(
        nama: 'Tenaga Angin',
        kategori: 'Wind Turbine Farm',
        kapasitas: '320 MW',
        efisiensi: '88%',
        lokasi: 'Sidrap, Sulawesi Selatan',
        gambar: 'assets/images/wind.png',
      ),
      EnergyItem(
        nama: 'Pembangkit Air',
        kategori: 'Hydroelectric Power',
        kapasitas: '680 MW',
        efisiensi: '95%',
        lokasi: 'Jatiluhur, Jawa Barat',
        gambar: 'assets/images/hydro.png',
      ),
      EnergyItem(
        nama: 'Biomassa',
        kategori: 'Bioenergy System',
        kapasitas: '210 MW',
        efisiensi: '84%',
        lokasi: 'Pelalawan, Riau',
        gambar: 'assets/images/biomassa.png',
      ),
      EnergyItem(
        nama: 'Panas Bumi',
        kategori: 'Geothermal Plant',
        kapasitas: '540 MW',
        efisiensi: '90%',
        lokasi: 'Kamojang, Jawa Barat',
        gambar: 'assets/images/geothermal.png',
      ),
    ];
  }
}

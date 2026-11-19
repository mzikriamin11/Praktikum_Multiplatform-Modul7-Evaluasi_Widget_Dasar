import 'package:flutter/material.dart';

void main() {
  runApp(const EvaluasiApp());
}

class EvaluasiApp extends StatelessWidget {
  const EvaluasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P07 Widget Evaluasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const EvaluasiHomePage(),
    );
  }
}

class EvaluasiHomePage extends StatefulWidget {
  const EvaluasiHomePage({super.key});

  @override
  State<EvaluasiHomePage> createState() => _EvaluasiHomePageState();
}

class _EvaluasiHomePageState extends State<EvaluasiHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Tugas1MahasiswaPage(),
    Tugas2HariPage(),
    Tugas3ProfilPage(),
  ];

  final List<String> _titles = const [
    'Tugas 1: Data Mahasiswa (Row & Column)',
    'Tugas 2: Deskripsi Hari (Button Interaktif)',
    'Tugas 3: Biodata & Gambar Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Tugas 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Tugas 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tugas 3',
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TUGAS 1: Menampilkan Data Mahasiswa Menggunakan Row dan Column
// ============================================================================
class Tugas1MahasiswaPage extends StatelessWidget {
  const Tugas1MahasiswaPage({super.key});

  Widget _buildCell(String text, {bool isHeader = false, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: isHeader ? Colors.blue.shade100 : Colors.transparent,
          border: Border.all(color: Colors.grey.shade400, width: 1.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Colors.blue.shade900 : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'DATA MAHASISWA',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            // Header Tabel (Row)
            Row(
              children: <Widget>[
                _buildCell('No', isHeader: true, flex: 1),
                _buildCell('NIM', isHeader: true, flex: 3),
                _buildCell('NAMA', isHeader: true, flex: 4),
              ],
            ),
            // Baris Data 1 (Row)
            Row(
              children: <Widget>[
                _buildCell('1', flex: 1),
                _buildCell('1106315', flex: 3),
                _buildCell('Depandi Enda', flex: 4),
              ],
            ),
            // Baris Data 2 (Row)
            Row(
              children: <Widget>[
                _buildCell('2', flex: 1),
                _buildCell('1106316', flex: 3),
                _buildCell('Muhammad Zikri Amin', flex: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TUGAS 2: Menampilkan Teks Deskripsi Hari Menggunakan Button (StatefulWidget)
// ============================================================================
class Tugas2HariPage extends StatefulWidget {
  const Tugas2HariPage({super.key});

  @override
  State<Tugas2HariPage> createState() => _Tugas2HariPageState();
}

class _Tugas2HariPageState extends State<Tugas2HariPage> {
  String selectedDay = 'Senin';
  String dayDescription = 'Hari yang luar biasa untuk memulai pekerjaanmu.';

  final Map<String, String> daysData = const {
    'Senin': 'Hari yang luar biasa untuk memulai pekerjaanmu.',
    'Selasa': 'Tetap semangat mengerjakan tugas.',
    'Rabu': 'Selalu bahagia dan bersyukur dengan apa yang telah diperoleh.',
    'Kamis': 'Kerja keras untuk menggapai cita-cita.',
    'Jumat': 'Jangan lupa untuk beribadah.',
    'Sabtu': 'Selamat weekend.',
    'Minggu': 'Manfaatkan hari minggumu untuk istrahat.',
  };

  void updateDay(String day) {
    setState(() {
      selectedDay = day;
      dayDescription = daysData[day] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'PILIH HARI',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          // Tombol-tombol hari
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: daysData.keys.map((day) {
              final isSelected = day == selectedDay;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isSelected ? Colors.blue.shade700 : Colors.blue.shade100,
                  foregroundColor:
                      isSelected ? Colors.white : Colors.blue.shade900,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                ),
                onPressed: () => updateDay(day),
                child: Text(
                  day,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 35.0),
          // Kotak Tampilan Deskripsi Hari
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blue.shade300, width: 2.0),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Hari $selectedDay',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  dayDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
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

// ============================================================================
// TUGAS 3: Menampilkan Gambar Profil & Biodata Diri
// ============================================================================
class Tugas3ProfilPage extends StatelessWidget {
  const Tugas3ProfilPage({super.key});

  Widget _buildBiodataItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue.shade700, size: 28.0),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          // Gambar Profil Lingkaran
          Center(
            child: Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade700, width: 4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'images/profile.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blue.shade100,
                      child: Icon(Icons.person,
                          size: 70.0, color: Colors.blue.shade700),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'BIODATA MAHASISWA',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          // Daftar Biodata (Row & Column)
          _buildBiodataItem(
            icon: Icons.badge,
            label: 'NAMA LENGKAP',
            value: 'Muhammad Zikri Amin',
          ),
          _buildBiodataItem(
            icon: Icons.cake,
            label: 'TEMPAT, TANGGAL LAHIR',
            value: 'Bengkalis, 01 Januari 1995',
          ),
          _buildBiodataItem(
            icon: Icons.email,
            label: 'EMAIL',
            value: 'mzikriamin@gmail.com',
          ),
          _buildBiodataItem(
            icon: Icons.phone,
            label: 'NOMOR HP',
            value: '0821-7266-xxxx',
          ),
          _buildBiodataItem(
            icon: Icons.sports_esports,
            label: 'HOBBY',
            value: 'Coding & Desain Grafis',
          ),
        ],
      ),
    );
  }
}

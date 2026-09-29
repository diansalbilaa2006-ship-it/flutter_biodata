import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1 Pemrograman Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormProfilePage extends StatefulWidget {
  const FormProfilePage({super.key});

  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _npmController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();

  String _savedNama = '';
  String _savedNpm = '';
  String _savedJurusan = '';
  bool _isSaved = false;

  // Path foto dari folder assets
  final String _assetImagePath = 'assets/foto.jpeg';

  void _saveData() {
    setState(() {
      _savedNama = _namaController.text;
      _savedNpm = _npmController.text;
      _savedJurusan = _jurusanController.text;
      _isSaved = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menampilkan Foto dari Assets
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(_assetImagePath),
            ),
            const SizedBox(height: 8),
            const Text('Foto Profil', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _npmController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NPM',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _jurusanController,
              decoration: const InputDecoration(
                labelText: 'Jurusan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveData,
                child: const Text('Save', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 30),
            if (_isSaved) ...[
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              const Text(
                'Output Data Tersimpan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(_assetImagePath),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama: $_savedNama', style: const TextStyle(fontSize: 16)),
                            Text('NPM: $_savedNpm', style: const TextStyle(fontSize: 16)),
                            Text('Jurusan: $_savedJurusan', style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
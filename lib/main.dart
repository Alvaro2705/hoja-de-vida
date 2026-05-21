import 'package:flutter/material.dart';

void main() {
  runApp(const MyResumeApp());
}

class MyResumeApp extends StatelessWidget {
  const MyResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alvaro Estiven - Hoja de Vida',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const ResumeScreen(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // BARRA LATERAL IZQUIERDA
          Container(
            width: 380,
            color: const Color(0xFF1E1E1E),
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: const AssetImage('assets/profile.jpg'),
                    backgroundColor: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    "ALVARO ESTIVEN FARRUFIA",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "INGENIERÍA EN SISTEMAS",
                    style: TextStyle(fontSize: 15, color: Color(0xFF64B5F6)),
                  ),
                ),
                const SizedBox(height: 40),

                _buildSectionTitle("CONTACTO"),
                _buildContactItem(Icons.phone, "(316) 212-3456"),
                _buildContactItem(Icons.email, "hola@unistioestupendo.com.co"),
                _buildContactItem(Icons.badge, "Identificación: 123456"),
                _buildContactItem(Icons.location_on, "Calle Cualquiera 123,\nCualquier Lugar"),

                const SizedBox(height: 35),
                _buildSectionTitle("REFERENCIAS"),
                _buildReference("Francisco Mercado", "Ensigna", "(316) 212-3456"),
                _buildReference("Pedro Fernández", "Borcelle", "(316) 212-3456"),

                const Spacer(),
                _buildSectionTitle("SITIO WEB"),
                const Text("www.unistioestupendo.com.co", style: TextStyle(color: Color(0xFF64B5F6))),
              ],
            ),
          ),

          // CONTENIDO DERECHO
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRightSection("SOBRE MÍ"),
                  const Text(
                    "Soy una persona muy comprometida con lo que me gusta y programar. Soy respetuoso con mi entorno y sé manejar bajo presión.",
                    style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                  ),

                  const SizedBox(height: 40),
                  _buildRightSection("EXPERIENCIA"),
                  _buildExperienceItem(
                    "2030", 
                    "Ingeniero de Sistemas",
                    "Desarrollo e implementación de soluciones tecnológicas completas, incluyendo análisis de requerimientos, diseño de bases de datos, desarrollo de aplicaciones web y móviles, y optimización de sistemas."
                  ),
                  _buildExperienceItem(
                    "2025", 
                    "Desarrollador de Software",
                    "Desarrollo de aplicaciones web y móviles utilizando tecnologías modernas. Participación en el ciclo completo de desarrollo: desde el diseño hasta la implementación y mantenimiento de software."
                  ),

                  const SizedBox(height: 40),
                  _buildRightSection("EDUCACIÓN"),
                  _buildEducationItem("2030", "Maestría en Desarrollo de Software", "Universidad De los Andes"),
                  _buildEducationItem("2026", "Especialización en Desarrollo de Software", "Universidad De los Andes"),
                  _buildEducationItem("2025", "Profesional en Ingeniería de Sistemas", "Universidad Antonio Jose Camacho"),

                  const SizedBox(height: 40),
                  _buildRightSection("HABILIDADES"),
                  Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    children: const [
                      Chip(label: Text("Liderazgo")),
                      Chip(label: Text("Gestión del tiempo")),
                      Chip(label: Text("Comunicación")),
                      Chip(label: Text("Trabajo en equipo")),
                      Chip(label: Text("Toma de decisiones")),
                      Chip(label: Text("Pensamiento estratégico")),
                    ],
                  ),

                  const SizedBox(height: 40),
                  _buildRightSection("IDIOMAS"),
                  const Row(
                    children: [
                      Text("Español", style: TextStyle(fontSize: 17, color: Colors.black87)),
                      Spacer(),
                      Text("Inglés", style: TextStyle(fontSize: 17, color: Colors.black87)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1));
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [Icon(icon, color: Colors.white70, size: 20), const SizedBox(width: 12), Expanded(child: Text(text, style: const TextStyle(color: Colors.white70)))]),
    );
  }

  Widget _buildReference(String name, String company, String phone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          Text(company, style: const TextStyle(color: Colors.white70)),
          Text(phone, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildRightSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget _buildExperienceItem(String year, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
          Text(description, style: const TextStyle(fontSize: 15.5, height: 1.5, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String year, String degree, String university) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          Text(degree, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
          Text(university, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AddCustomerScreen extends StatefulWidget {
  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Müşteri Bilgileri'),
                _buildTextField('Tarih', Icons.calendar_today),
                _buildTextField('İsim', Icons.person),
                _buildTextField('Soyisim', Icons.person_outline),
                _buildTextField('Telefon No', Icons.phone,
                    keyboardType: TextInputType.phone),
                _buildTextField(
                    'T.C. Kimlik', Icons.account_balance_wallet_outlined),
                const SizedBox(height: 20),
                _buildSectionTitle('Reçete Bilgisi'),
                _buildPrescriptionRow('Sağ Uzak'),
                _buildPrescriptionRow('Sağ Yakın'),
                _buildPrescriptionRow('Sol Uzak'),
                _buildPrescriptionRow('Sol Yakın'),
                const SizedBox(height: 20),

                // Dosya Seç butonunu ortada ve büyük yapmak için
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Dosya seçme işlemi
                    },
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.redAccent, // Icon rengi
                    ),
                    label: Text(
                      'Dosya Seç',
                      style: TextStyle(
                        color: Colors.redAccent, // Etiket rengi
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.redAccent, width: 2),
                      // Kenarlık rengi
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32), // Buton içi padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Kenarları yuvarlatmak için
                      ),
                      minimumSize: Size(200, 50), // Buton boyutu
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Kaydet butonunu ortada ve büyük yapmak için
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Kaydetme işlemi
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.redAccent, // Butonun arka plan rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Kenarları yuvarlatmak için
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32), // Buton içi padding
                      elevation: 5, // Hafif gölge efekti
                      minimumSize: Size(200, 50), // Buton boyutu
                    ),
                    child: Text(
                      'Kaydet',
                      style: TextStyle(
                        color: Colors.white, // Metin rengi
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label boş bırakılamaz';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPrescriptionRow(String prefix) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSmallTextField('$prefix Sph'),
        _buildSmallTextField('$prefix Cyl'),
        _buildSmallTextField('$prefix Aks'),
      ],
    );
  }

  Widget _buildSmallTextField(String label) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label boş bırakılamaz';
            }
            return null;
          },
        ),
      ),
    );
  }
}

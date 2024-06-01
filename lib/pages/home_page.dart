import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _specialization = 'Dokter Umum';

  List<String> _specializations = [
    'Dokter Umum',
    'Spesialis Kandungan',
    'Spesialis Anak',
    'Spesialis Bedah',
    'Spesialis Penyakit dalam',
    'Spesialis Jantung',
    'Spesialis Mata',
    'Spesialis Ortophaedi',
    'Spesialis Fisik dan Rehabilitas',
    'Spesialis Radiologi',
    'Spesialis Patologi',
    'Spesialis Anestesiologi',
    'Spesialis Neurologi',
  ];

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _complaints = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Appointment submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Text('Daftar Online',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Sakit? Tunggu apa lagi?',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Langsung daftar pertemuan dengan Dokter terpercaya!',
                style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                'lib/images/formPic.svg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                    color: Colors.tealAccent[100],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Spesialisasi Dokter',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: _specialization,
                        onChanged: (newValue) {
                          setState(() {
                            _specialization = newValue!;
                          });
                        },
                        items: _specializations.map((specialization) {
                          return DropdownMenuItem<String>(
                            value: specialization,
                            child: Text(specialization),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tanggal',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                            text: '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'
                        ),
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Waktu',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                            text: '${_selectedTime.hour}:${_selectedTime.minute}'
                        ),
                        onTap: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _selectedTime = pickedTime;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Keluhan',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tolong masukan keluhan penyakit';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _complaints = value!;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(
                          'Kirim',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


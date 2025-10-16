# Template Naskah Skripsi LaTeX

Template Naskah Skripsi dengan typesetting LaTeX untuk **Program Studi Teknik Komputer**, **Universitas Teknologi Digital Indonesia (UTDI)**. Template ini merupakan hasil modifikasi dan penyesuaian dari template sebelumnya milik UGM agar sesuai dengan kebutuhan format penulisan skripsi di lingkungan UTDI.

Semoga template ini bermanfaat bagi mahasiswa Teknik Komputer UTDI yang ingin menulis naskah skripsinya dengan format profesional, rapi, dan otomatis menggunakan LaTeX. Anda sangat diperbolehkan untuk turut berkontribusi dalam pengembangan template ini melalui *Fork*, *Pull Request*, *Create New Issue*, atau dengan menjadi kontributor pada repository ini.

Terima kasih.

---

## Download

Silakan download versi terbaru di repository GitHub berikut:
👉 [https://github.com/nugraonline/template-skripsi-utdi](https://github.com/nugraonline/template-skripsi-utdi)

---

## Quick Start

1. **Siapkan environment LaTeX** di komputer Anda beserta editornya. Paket LaTeX biasanya cukup besar, jadi pastikan koneksi internet stabil.

   * [*Windows*](https://www.google.com/search?q=install+latex+on+windows)
   * [*Linux*](https://www.google.com/search?q=install+latex+on+linux)
   * [*Mac OS X*](https://www.google.com/search?q=install+latex+on+mac)
   * [*Overleaf (Online Editor)*](https://www.overleaf.com/) — cocok untuk yang ingin langsung menulis tanpa instalasi lokal.

2. *Clone* repository ini dengan Git atau [unduh file zip-nya](https://github.com/nugraonline/template-skripsi-utdi/releases).

3. Mulailah menulis naskah Anda! Struktur dan panduan tiap file dijelaskan di bawah.

4. Jika baru pertama kali menggunakan LaTeX, berikut referensi belajar cepat:

   * [Tutorial LaTeX Bahasa Indonesia](https://www.google.com/search?q=tutorial+menggunakan+latex)
   * [LaTeX Tutorial (English)](https://www.google.com/search?q=latex+tutorial)

---

## Struktur Folder

```
template-skripsi-utdi/
├── gambar/
│   ├── logountdi.png
│   └── ilustrasi.png
├── bab1.tex
├── bab2.tex
├── bab3.tex
├── bab4.tex
├── bab5.tex
├── daftar-pustaka.bib
├── template-skripsi-utdi.pdf
├── template-skripsi-utdi.tex
└── utdiskripsi.cls
```

### bab1.tex – bab5.tex

Berisi isi utama skripsi dari **BAB I (Pendahuluan)** hingga **BAB V (Kesimpulan dan Saran)**. Anda bisa menambah atau menghapus bab sesuai kebutuhan.

### daftar-pustaka.bib

File ini berisi daftar referensi dalam format BibTeX yang digunakan untuk menghasilkan daftar pustaka otomatis. Anda bisa mengisi file ini dari aplikasi manajemen referensi seperti **Mendeley**, **Zotero**, atau **EndNote**.

### template-skripsi-utdi.tex

File utama skripsi yang memanggil semua bagian (bab, daftar pustaka, lampiran, dll.). Di dalam file ini, Anda dapat mengatur:

* Judul skripsi
* Nama penulis dan NIM
* Nama dosen pembimbing
* Tahun
* Fakultas dan program studi

### template-skripsi-utdi.pdf

Hasil akhir skripsi dalam bentuk PDF yang di-*compile* otomatis dari file LaTeX Anda. Siap untuk dikumpulkan atau dijilid.

### utdiskripsi.cls

File kelas LaTeX yang mengatur seluruh format skripsi UTDI: cover, halaman pengesahan, daftar isi, daftar tabel, daftar pustaka, serta gaya penulisan yang sesuai pedoman kampus.

### gambar/

Folder tempat menyimpan gambar yang digunakan dalam skripsi. Gambar logo UTDI sudah disediakan secara default (`logountdi.png`).

---

## Bonus

Jika Anda *clone* repository ini menggunakan **Git**, tersedia beberapa branch tambahan untuk referensi:

* **main** — Template skripsi standar UTDI (disarankan untuk digunakan mahasiswa aktif)
* **contoh-skripsi-lengkap** — Contoh isi skripsi lengkap dari mahasiswa Teknik Komputer
* **dokumen-kampus** — Berisi contoh lembar pengesahan, pernyataan orisinalitas, dan panduan format kampus

---

## Lisensi

Template skripsi ini dilisensikan dengan **Lisensi MIT**. Anda bebas menggunakannya, menyalin, memodifikasi, dan mendistribusikannya selama tetap mencantumkan atribusi ke pembuat template ini.

📄 Copyright (c) 2025 Ludang Prasetyo Nugroho

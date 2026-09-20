# 🏛️ KAYRA Suite: Masaüstü Belge & Görsel Tasarım Ekosistemi

### *Türkiye'nin Açık Kaynaklı, Yerel ve Güvenli "Acrobat Pro & Adobe Express" Alternatifi*

> ### ⚠️ Önemli Bilgilendirme: Proje Durumu (Teknik Önizleme & MVP)
>
> **KAYRA Suite şu anda aktif geliştirme ve kavram kanıtlama (Proof of Concept / Minimum Viable Product) aşamasındadır.**
>
> Dokümantasyonda ve demoda yer alan tüm temel yetenekler (MuPDF stream redaction, Fabric.js vektörel afiş motoru, kesintisiz dikey sayfa akışı, 5070 kriptografik damgalama ve çift modüllü başlatıcı mimarisi) **çalışır durumdaki canlı prototiplerdir**. Proje, kurumsal kamu ve sivil sektör ihtiyaçlarına göre geri bildirimlerle olgunlaştırılmaya devam etmektedir.

## 📌 İçindekiler

1. [Projenin Doğuş Amacı ve Stratejik Arka Plan](#-projenin-doğuş-amacı-ve-stratejik-arka-plan)

2. [Süit Mimarisi ve Modüller](#-süit-mimarisi-ve-modüller)

   * [KAYRA Belge (Acrobat Pro Muadili)](#1-kayra-belge-profesyonel-pdf--doküman-stüdyosu)

   * [KAYRA Tuval (Canva / Adobe Express Muadili)](#2-kayra-tuval-grafik-tasarım--afiş-stüdyosu)

   * [KAYRA Creative Hub (Modüler Başlatıcı)](#3-kayra-creative-hub-modüler-yönlendirici)

3. [Teknik Mimari ve Güvenlik Felsefesi](#-teknik-mimari-ve-güvenlik-felsefesi)

4. [Telif Hakları, Lisanslar ve Bağımlılık Bildirimi](#-telif-hakları-lisanslar-ve-bağımlılık-bildirimi)

5. [Yapay Zekâ Kullanım Beyanı](#-yapay-zekâ-kullanım-beyanı-ai-transparency-statement)

6. [Geliştirme Yol Haritası (Roadmap)](#-geliştirme-yol-haritası-roadmap)

7. [Kurulum, Derleme ve Çalıştırma](#-kurulum-derleme-ve-çalıştırma)

8. [Otomatik Güncelleme Sistemi](#-otomatik-güncelleme-sistemi-auto-updater)

## 🎯 Projenin Doğuş Amacı ve Stratejik Arka Plan

> *"Türkiye'de sivil kurumsal yazılım pazarında ve kamu kurumlarında dışa bağımlılık oranı %82 ile %86 bandında seyretmektedir. Kamu kurumlarında kullanılan yazılım portföyünün yaklaşık %90'ı yabancı mülkiyetçi lisanslardan oluşmaktadır. Grafik ve medya işleme yazılımlarında ise pazar tamamen yabancı tekellere bağımlı olup, ticari yerli muadil olgunluğu 1/10 seviyesindedir."*
>
> — **Türkiye Yazılım Ekosisteminde Dışa Bağımlılık Raporu**

KAYRA Suite, masaüstü belge ve görsel üretim alanındaki bu yapısal dışa bağımlılığı kırmak ve kurumlara bağımsız bir alternatif sunmak amacıyla tasarlanmış bir **teknoloji önizleme projesidir**:

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                          KAYRA SUITE HEDEF TABLOSU                              │
├────────────────────────┬───────────────────────────────┬────────────────────────┤
│ Kategori               │ Yabancı Pazar Standardı       │ KAYRA Karşılığı        │
├────────────────────────┼───────────────────────────────┼────────────────────────┤
│ PDF & Doküman Güvenliği│ Adobe Acrobat Pro DC          │ KAYRA Belge (Demo)     │
│ Görsel & Afiş Tasarımı │ Canva / Adobe Express         │ KAYRA Tuval (Demo)     │
│ E-İmza & Onay          │ DocuSign / Adobe Sign         │ 5070 Sayılı Yerel İmza │
│ KVKK / Veri Güvenliği  │ Yurt dışı bulut sunucuları    │ %100 Yerel Bellek (WASM│
│ İşletim Sistemi        │ Yalnızca Windows / macOS      │ Pardus Linux + Windows │
└────────────────────────┴───────────────────────────────┴────────────────────────┘

```

### 1. KVKK ve Veri Egemenliği Kalkanı

1 Eylül 2024 tarihinde yürürlüğe giren yeni KVKK reformu uyarınca, kişisel verilerin yabancı SaaS platformları (Adobe Cloud, Canva, Google vb.) aracılığıyla yurt dışındaki sunuculara aktarılması katı standart sözleşmelere ve Lahey Apostil şartlarına bağlanmıştır. KAYRA Suite, **"Sıfır Ağ Sızıntısı (Zero-Telemetry)"** prensibiyle çalışır. Açtığınız hiçbir PDF, kimlik numarası veya afiş tasarımı internete gönderilmez; tüm işlemler doğrudan yerel işlemcinizde ve belleğinizde gerçekleşir.

### 2. Döviz Çıkışı ve Lisans Maliyeti Baskısı

Döviz kurlarındaki artış ve yurt dışı yazılımlara uygulanan %20 Stopaj ile 2 No'lu KDV (KDV Tevkifatı) yükümlülükleri, kurumlar ve bağımsız profesyoneller için aylık abonelikleri sürdürülemez maliyetlere ulaştırmıştır. KAYRA Suite, tek seferlik veya açık kaynak kullanım modeliyle döviz bazlı lisans yükünü tamamen ortadan kaldırmayı hedefler.

### 3. 2023/13 Sayılı Cumhurbaşkanlığı Genelgesi ve Pardus Uyumu

Kamuda Açık Kaynak Kodlu Yazılım (AKKY) kullanımını zorunlu kılan 2023/13 sayılı Genelge doğrultusunda, kamu kurumlarının ve okulların (etkileşimli tahtalar dahil) Pardus / Linux altyapısına geçişi hızlanmıştır. KAYRA Suite, Rust tabanlı Tauri v2 çekirdeği sayesinde hem **T.C. Milli İşletim Sistemi Pardus (Debian .deb)** hem de **Windows 10/11 (.exe / .msi)** ortamlarında aynı kararlılıkla çalışır.

## 📦 Süit Mimarisi ve Modüller

KAYRA Suite, bağımsız çalışabilen iki ana uzmanlık modülü ve bunları koordine eden bir merkezden oluşur.

```
                           ┌────────────────────────┐
                           │   KAYRA Creative Hub   │
                           │      (index.html)      │
                           └───────────┬────────────┘
                                       │
                    ┌──────────────────┴──────────────────┐
                    ▼                                     ▼
        ┌───────────────────────┐             ┌───────────────────────┐
        │      KAYRA Belge      │             │      KAYRA Tuval      │
        │     (belge.html)      │             │     (tuval.html)      │
        ├───────────────────────┤             ├───────────────────────┤
        │ • MuPDF Byte Redaction│             │ • Fabric.js Motoru    │
        │ • 5070 E-İmza Kaşesi  │             │ • Vektörel Şekiller   │
        │ • Canva Metin Modu    │             │ • 80'li Renk Matrisi  │
        │ • Çoklu Sayfa Akışı   │             │ • Katman Yönetimi     │
        │ • 8 Formatta İndirme  │             │ • Çoklu Çözünürlük    │
        └───────────────────────┘             └───────────────────────┘

```

### 1. KAYRA Belge: Profesyonel PDF & Doküman Stüdyosu

Mevzuata uygun, resmî nitelikte belge yönetimi için geliştirilmiştir.

* **MuPDF Destekli Kriptografik KVKK Karartma (Gerçek Redaction):** Piyasadaki yüzeysel araçlar gibi yazının üstüne siyah kutu koyup geçmez; MuPDF WebAssembly motoru ile metni PDF içerik akışından ve font dizininden kalıcı olarak söker. TCKN, IBAN ve telefon numaralarını otomatik tarar.

* **Canva Tarzı Doğrudan PDF İçi Metin Düzenleme:** PDF üzerindeki herhangi bir yazıya çift tıklayarak orijinal font ailesini bozmadan metni anında revize etme imkânı sunar.

* **5070 Sayılı Kanun Uyumlu E-İmza Kaşeleme:** Kamu SM, TÜRKTRUST veya E-Tuğra sertifikaları için belge SHA-256 kriptografik parmak izini hesaplar ve doğrulanabilir imza bandı yerleştirir.

* **Acrobat Tarzı Kesintisiz Sayfa Akışı:** Sayfaları tek tek değil, dikey olarak art arda kesintisiz kaydırarak okuma ve düzenleme deneyimi.

* **8 Farklı Formatta Dışa Aktarma:** PDF, Microsoft Word (.docx), OpenDocument (.odt), Zengin Metin (.rtf), Düz Metin (.txt), Web Sayfası (.html), EPUB ve Markdown (.md).

* **Gelişmiş Filigran & Sayfa Düzeni:** Tekli merkez, ızgara, dipnot ve kenar bandı filigran basma; küçük resimlerden (thumbnails) sayfaları çoğaltma, sıralama ve döndürme.

### 2. KAYRA Tuval: Grafik Tasarım & Afiş Stüdyosu

Pardus ve Windows üzerinde Canva / Adobe Express konforunda grafik üretimi sağlar.

* **Fabric.js Vektörel Çizim Motoru:** Gecikmesiz, GPU ivmeli nesne manipülasyonu.

* **Hazır Resmî Şablonlar:** Resmî Kurum Duyuru Afişi, Başarı & Katılım Sertifikası, Büyük Kampanya Posteri, Konferans İlanı.

* **80 Renkli Dairesel Matris & 2D HSV Spektrumu:** Google Dokümanlar tarzı hızlı renk seçici ve profesyonel renk çarkı.

* **Katman & Hiyerarşi Denetimi:** Öğeleri kilitleme, gruplama, çözme, öne/arkaya alma, şeffaflık ve gölge parametreleri.

* **Çoklu Çözünürlükte İndirme:** A4 Belge, Instagram Kare/Hikaye, YouTube Thumbnail ebatlarında; PNG (şeffaf zemin), JPG, SVG ve doğrudan PDF formatında dışa aktarma.

### 3. KAYRA Creative Hub: Modüler Yönlendirici

Kullanıcının tercihlerini yöneten hafif ve kararlı bir ana karşılama ekranıdır:

* Kurulum sihirbazında seçilmeyen modülü otomatik algılar, arayüzde pasifize eder ("Yüklü Değildir" uyarısı).

* "Seçimimi hatırla" özelliği ile kullanıcının her zaman doğrudan Belge veya Tuval ile açılmasını sağlar.

## 🛡️ Teknik Mimari ve Güvenlik Felsefesi

```
[ Arayüz Katmanı: HTML5 / Tailwind CSS / Vanilla JS ]
                     │
    ┌────────────────┴────────────────┐
    ▼                                 ▼
[ Belge Motoru: PDF.js & MuPDF ]    [ Tasarım Motoru: Fabric.js ]
    │                                 │
    └────────────────┬────────────────┘
                     ▼
[ İstemci Çekirdeği: Tauri v2 (Rust + WebView2 / WebKitGTK) ]
                     │
    ┌────────────────┴────────────────┐
    ▼                                 ▼
[ Windows Dağıtımı (.exe / .msi) ]  [ Pardus Dağıtımı (.deb) ]

```

* **Hafiflik:** Electron tabanlı hantal yazılımlar 200-300 MB bellek tüketirken, Tauri v2 mimarisi sayesinde KAYRA Suite yalnızca işletim sisteminin yerel WebView motorunu kullanır. Başlangıç paket boyutu \~15 MB civarındadır.

* **Veri Mahremiyeti:** Uygulama içerisinde hiçbir harici analitik aracı, kullanıcı takip kodu veya gizli veri toplama mekanizması yer almaz.

## ⚖️ Telif Hakları, Lisanslar ve Bağımlılık Bildirimi

KAYRA Suite, açık kaynak dünyasının güçlü kütüphanelerinin omuzlarında yükselmektedir. Projede yer alan üçüncü taraf bağımlılıklar ve lisansları aşağıda belirtilmiştir:

| **Bileşen** | **Kullanım Amacı** | **Lisans** | **Telif Sahibi / Kaynak** | 
| **Tauri v2** | Masaüstü Çerçevesi (Rust) | Apache-2.0 / MIT | © Tauri Programme contributors | 
| **PDF.js** | PDF Görüntüleme & TextLayer | Apache-2.0 | © Mozilla Foundation | 
| **pdf-lib** | PDF Manipülasyonu & Çizim | MIT | © Andrew Dillon (Hopding) | 
| **fontkit** | Unicode Font & Glif Gömme | Apache-2.0 | © Devon Govett (FolioJS) | 
| **MuPDF (WASM)** | Kalıcı Redaction & Sanitization | AGPL-3.0 / Commercial | © Artifex Software, Inc. | 
| **Fabric.js** | Vektörel Tuval & Nesne Motoru | MIT | © Juriy Zaytsev (kangax) | 
| **Tailwind CSS** | Arayüz Tasarımı | MIT | © Tailwind Labs, Inc. | 
| **FontAwesome** | Arayüz İkon Seti (Free) | CC BY 4.0 / SIL OFL | © Fonticons, Inc. | 
| **Google Fonts** | Arimo, Inter, JetBrains Mono | SIL Open Font License | © Google LLC & Katkıda Bulunanlar | 

*Üçüncü taraf kütüphanelerin tam lisans metinleri ve bildirimleri için [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) dosyasını inceleyebilirsiniz.*

## 🤖 Yapay Zekâ Kullanım Beyanı (AI Transparency Statement)

Bu projenin geliştirilme sürecinde dürüstlük ve şeffaflık ilkelerine bağlı kalınmıştır:

> **Açık Beyan:** KAYRA Suite ekosisteminin mimari tasarımında, karmaşık algoritmaların (Manyetik açı kenetlenmesi, MuPDF WebAssembly redaction boru hattı, PDF.js koordinat dönüşüm köprüleri ve Tauri v2 NSIS script kancaları) kurgulanmasında ve kod refaktörleme aşamalarında **Google Gemini (Büyük Dil Modeli)** bir kıdemli yazılım eşlikçisi ve teknik danışman olarak kullanılmıştır. Projenin fikrî mülkiyeti, yerelleştirme vizyonu, tasarım hiyerarşisi ve denetimi proje geliştiricisine aittir.

## 🗺️ Geliştirme Yol Haritası (Roadmap)

KAYRA Suite'in MVP / Demo aşamasından tam kararlı sürüme geçiş planı:

* \[x\] **Faz 1 (MVP Demo):** İki modüllü mimarinin kurulması, MuPDF redaction, Fabric.js afiş motoru, 8 formatta dışa aktarma.

* \[x\] **Faz 2 (Masaüstü Entegrasyonu):** Tauri v2 Rust çekirdeği, NSIS modüler kurulum sihirbazı, otomatik GitHub Releases güncelleyicisi.

* \[ \] **Faz 3 (Kurumsal Test & Sıkılaştırma):** Gerçek akıllı kart USB dongle (AKİS / Kamu SM) donanımsal e-imza kütüphanesi entegrasyonu.

* \[ \] **Faz 4 (Pardus / Tübitak Ekosistemi):** Pardus Mağaza (Apt Repo) paketlerinin resmî doğrulaması ve yerel topluluk testleri.

## 🔨 Kurulum, Derleme ve Çalıştırma

### Gereksinimler

* [Node.js](https://nodejs.org/?utm_source=gemini) (LTS sürümü)

* [Rust](https://rustup.rs/?utm_source=gemini) (v1.78 veya üzeri)

* **Windows için:** Visual Studio C++ Derleme Araçları (Desktop development with C++)

* **Pardus / Linux için:** `libwebkit2gtk-4.1-dev`, `build-essential`, `curl`, `libssl-dev`, `libayatana-appindicator3-dev`

### Yerel Geliştirme Modu

```
# 1. Proje bağımlılıklarını kurun
npm install

# 2. Canlı geliştirme sunucusunu masaüstünde başlatın
npm run tauri dev

```

### Kurulum Paketlerini Derleme (Production Build)

```
# Windows (.exe / .msi) veya Linux (.deb) paketini oluşturur
npm run tauri build

```

Oluşan paketler `src-tauri/target/release/bundle/` altında toplanacaktır.

## 🔄 Otomatik Güncelleme Sistemi (Auto-Updater)

KAYRA Suite, harici bir güncelleme sunucusuna ihtiyaç duymadan doğrudan **GitHub Releases** altyapısıyla çalışır.

1. `tauri.conf.json` ve `package.json` içindeki sürüm numarasını artırın (Örn: `1.0.1`).

2. Değişiklikleri kaydedip yeni sürüm etiketiyle gönderin:

   ```
   git add .
   git commit -m "chore: bump version to v1.0.1"
   git tag v1.0.1
   git push origin v1.0.1
   
   ```

3. GitHub Actions bulut sunucuları Windows ve Pardus paketlerini otomatik derler, `latest.json` dosyasını imzalar ve yayınlar.

4. Kullanıcılar uygulamayı açtığında **"Yeni Güncelleme Mevcut!"** penceresi belirir ve tek tıkla güncelleme tamamlanır.

## 📄 Lisans

Bu proje **MIT Lisansı** altında açık kaynak olarak korunmaktadır. Ticari ve kurumsal ortamlarda özgürce kullanılabilir, dağıtılabilir ve uyarlanabilir. Detaylar için [LICENSE](LICENSE) dosyasına bakınız.

# Tauri + Vanilla

This template should help get you started developing with Tauri in vanilla HTML, CSS and Javascript.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

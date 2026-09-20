use std::env;

#[tauri::command]
fn get_startup_params() -> serde_json::Value {
    let mut target = "hub".to_string();

    // 1. Doğrudan EXE ismiyle başlatılmış mı kontrol et (Örn: "KAYRA Belge.exe")
    if let Ok(exe_path) = env::current_exe() {
        let exe_name = exe_path
            .file_name()
            .unwrap_or_default()
            .to_string_lossy()
            .to_lowercase();

        if exe_name.contains("belge") {
            target = "belge".to_string();
        } else if exe_name.contains("tuval") {
            target = "tuval".to_string();
        }
    }

    // 2. Kısayol argümanı ile başlatılmış mı kontrol et (app=belge veya app=tuval)
    let args: Vec<String> = env::args().collect();
    for arg in args.iter().skip(1) {
        let lower = arg.to_lowercase();
        if lower.contains("belge") {
            target = "belge".to_string();
            break;
        } else if lower.contains("tuval") {
            target = "tuval".to_string();
            break;
        }
    }

    serde_json::json!({
        "target": target
    })
}

#[tauri::command]
fn get_installed_modules() -> serde_json::Value {
    let mut belge_installed = false;
    let mut tuval_installed = false;

    if let Ok(exe_path) = env::current_exe() {
        if let Some(exe_dir) = exe_path.parent() {
            // Fiziksel .exe dosyalarının varlığını doğrula
            if exe_dir.join("KAYRA Belge.exe").exists() {
                belge_installed = true;
            }
            if exe_dir.join("KAYRA Tuval.exe").exists() {
                tuval_installed = true;
            }

            // Geliştirme ortamı (tauri dev) için akıllı fallback
            if !belge_installed && !tuval_installed {
                let exe_name = exe_path.file_name().unwrap_or_default().to_string_lossy().to_lowercase();
                if exe_name.contains("belge") {
                    belge_installed = true;
                } else if exe_name.contains("tuval") {
                    tuval_installed = true;
                } else {
                    // Geliştirme anında iki modül de test edilebilsin
                    belge_installed = true;
                    tuval_installed = true;
                }
            }
        }
    }

    serde_json::json!({
        "belge": belge_installed,
        "tuval": tuval_installed
    })
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_process::init())
        .plugin(tauri_plugin_updater::Builder::new().build())
        .plugin(tauri_plugin_opener::init())
        .invoke_handler(tauri::generate_handler![
            get_startup_params,
            get_installed_modules
        ])
        .run(tauri::generate_context!())
        .expect("KAYRA Suite başlatılırken hata oluştu");
}
!include "nsDialogs.nsh"
!include "LogicLib.nsh"

Var Dialog
Var CheckboxBelge
Var CheckboxTuval
Var BelgeState
Var TuvalState

; Kurulum sihirbazına özel seçim sayfasını ekler
Page custom ComponentSelectionPageCreate ComponentSelectionPageLeave

Function ComponentSelectionPageCreate
  nsDialogs::Create 1018
  Pop $Dialog
  ${If} $Dialog == error
    Abort
  ${EndIf}

  !insertmacro MUI_HEADER_TEXT "Bileşen ve Modül Seçimi" "Bilgisayarınıza kurulacak KAYRA Suite modüllerini belirleyin."

  ${NSD_CreateLabel} 0 0 100% 24u "Lütfen masaüstünüze ve başlat menünüze eklenecek uygulamaları işaretleyin:"
  Pop $0

  ${NSD_CreateCheckbox} 15u 32u 100% 14u "KAYRA Belge (PDF Düzenleme & KVKK Karartma)"
  Pop $CheckboxBelge
  ${NSD_SetState} $CheckboxBelge ${BST_CHECKED}

  ${NSD_CreateCheckbox} 15u 52u 100% 14u "KAYRA Tuval (Grafik Tasarım & Afiş Stüdyosu)"
  Pop $CheckboxTuval
  ${NSD_SetState} $CheckboxTuval ${BST_CHECKED}

  nsDialogs::Show
FunctionEnd

Function ComponentSelectionPageLeave
  ${NSD_GetState} $CheckboxBelge $BelgeState
  ${NSD_GetState} $CheckboxTuval $TuvalState

  ; Kullanıcı ikisinin de işaretini kaldırdıysa uyarı ver
  ${If} $BelgeState == 0
  ${AndIf} $TuvalState == 0
    MessageBox MB_ICONEXCLAMATION "Lütfen kurulmasını istediğiniz en az bir modülü seçiniz!"
    Abort
  ${EndIf}
FunctionEnd

; Kurulum tamamlandığında seçilen kısayolları oluşturan tekil fonksiyon
Function SetupKayraShortcuts
  ; Standart genel kısayolları temizle
  Delete "$DESKTOP\KAYRA Suite.lnk"
  Delete "$SMPROGRAMS\KAYRA Suite.lnk"

  ; 1. Sadece Belge seçildiyse:
  ${If} $BelgeState == 1
  ${AndIf} $TuvalState == 0
    CreateShortCut "$DESKTOP\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge"
    CreateShortCut "$SMPROGRAMS\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge"
    CreateShortCut "$DESKTOP\KAYRA Creative Hub.lnk" "$INSTDIR\KAYRA Suite.exe" "modules=belge"
  ${EndIf}

  ; 2. Sadece Tuval seçildiyse:
  ${If} $BelgeState == 0
  ${AndIf} $TuvalState == 1
    CreateShortCut "$DESKTOP\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval"
    CreateShortCut "$SMPROGRAMS\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval"
    CreateShortCut "$DESKTOP\KAYRA Creative Hub.lnk" "$INSTDIR\KAYRA Suite.exe" "modules=tuval"
  ${EndIf}

  ; 3. İkisi birden seçildiyse:
  ${If} $BelgeState == 1
  ${AndIf} $TuvalState == 1
    CreateShortCut "$DESKTOP\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge"
    CreateShortCut "$SMPROGRAMS\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge"
    CreateShortCut "$DESKTOP\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval"
    CreateShortCut "$SMPROGRAMS\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval"
    CreateShortCut "$DESKTOP\KAYRA Creative Hub.lnk" "$INSTDIR\KAYRA Suite.exe" "modules=belge,tuval"
  ${EndIf}
FunctionEnd

; Tauri v2 kurulum kancaları
!macro customInstall
  Call SetupKayraShortcuts
!macroend

!macro NSIS_HOOK_POSTINSTALL
  Call SetupKayraShortcuts
!macroend
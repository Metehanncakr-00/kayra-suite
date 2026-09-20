!include "nsDialogs.nsh"
!include "LogicLib.nsh"

Var Dialog
Var CheckboxBelge
Var CheckboxTuval
Var BelgeState
Var TuvalState

; Kurulum sihirbazı özel modül seçim sayfası
Page custom ComponentSelectionPageCreate ComponentSelectionPageLeave

Function ComponentSelectionPageCreate
  nsDialogs::Create 1018
  Pop $Dialog
  ${If} $Dialog == error
    Abort
  ${EndIf}

  !insertmacro MUI_HEADER_TEXT "Bileşen ve Modül Seçimi" "Bilgisayarınıza kurulacak KAYRA Suite modüllerini belirleyin."

  ${NSD_CreateLabel} 0 0 100% 24u "Lütfen bilgisayarınıza kurulacak bağımsız uygulamaları işaretleyin:"
  Pop $0

  ${NSD_CreateCheckbox} 15u 32u 100% 14u "KAYRA Belge (PDF Düzenleme, 5070 E-İmza & KVKK Karartma)"
  Pop $CheckboxBelge
  ${NSD_SetState} $CheckboxBelge ${BST_CHECKED}

  ${NSD_CreateCheckbox} 15u 52u 100% 14u "KAYRA Tuval (Grafik Tasarım, Vektörel Afiş & Sosyal Medya)"
  Pop $CheckboxTuval
  ${NSD_SetState} $CheckboxTuval ${BST_CHECKED}

  nsDialogs::Show
FunctionEnd

Function ComponentSelectionPageLeave
  ${NSD_GetState} $CheckboxBelge $BelgeState
  ${NSD_GetState} $CheckboxTuval $TuvalState

  ; En az bir kutucuğun işaretli olmasını zorunlu tut
  ${If} $BelgeState == 0
  ${AndIf} $TuvalState == 0
    MessageBox MB_ICONEXCLAMATION "Lütfen kurulmasını istediğiniz en az bir modülü seçiniz!"
    Abort
  ${EndIf}
FunctionEnd

Function SetupKayraShortcuts
  ; 1. Eski kısayolları temizle
  Delete "$DESKTOP\KAYRA Suite.lnk"
  Delete "$SMPROGRAMS\KAYRA Suite.lnk"
  Delete "$DESKTOP\KAYRA Belge.lnk"
  Delete "$SMPROGRAMS\KAYRA Belge.lnk"
  Delete "$DESKTOP\KAYRA Tuval.lnk"
  Delete "$SMPROGRAMS\KAYRA Tuval.lnk"
  Delete "$DESKTOP\KAYRA Creative Hub.lnk"
  Delete "$SMPROGRAMS\KAYRA Creative Hub.lnk"

  ; 2. Tauri'nin derleyip kurduğu ana ikili dosyayı ($R0) kesin olarak bul
  StrCpy $R0 ""
  ${If} ${FileExists} "$INSTDIR\kayra-suite.exe"
    StrCpy $R0 "$INSTDIR\kayra-suite.exe"
  ${ElseIf} ${FileExists} "$INSTDIR\KAYRA Suite.exe"
    StrCpy $R0 "$INSTDIR\KAYRA Suite.exe"
  ${ElseIf} ${FileExists} "$INSTDIR\kayra-desktop.exe"
    StrCpy $R0 "$INSTDIR\kayra-desktop.exe"
  ${ElseIf} ${FileExists} "$INSTDIR\${MAINBINARYNAME}.exe"
    StrCpy $R0 "$INSTDIR\${MAINBINARYNAME}.exe"
  ${EndIf}

  ; 3. Creative Hub için ana dosyayı KAYRA Suite.exe adıyla hazırla
  ${If} $R0 != "$INSTDIR\KAYRA Suite.exe"
  ${AndIf} $R0 != ""
    CopyFiles /SILENT "$R0" "$INSTDIR\KAYRA Suite.exe"
  ${EndIf}

  ; 4. KAYRA Belge modülü seçildiyse bağımsız .exe üret, seçilmediyse sil
  ${If} $BelgeState == 1
    CopyFiles /SILENT "$R0" "$INSTDIR\KAYRA Belge.exe"
    CreateShortCut "$DESKTOP\KAYRA Belge.lnk" "$INSTDIR\KAYRA Belge.exe" "app=belge"
    CreateShortCut "$SMPROGRAMS\KAYRA Belge.lnk" "$INSTDIR\KAYRA Belge.exe" "app=belge"
  ${Else}
    Delete "$INSTDIR\KAYRA Belge.exe"
  ${EndIf}

  ; 5. KAYRA Tuval modülü seçildiyse bağımsız .exe üret, seçilmediyse sil
  ${If} $TuvalState == 1
    CopyFiles /SILENT "$R0" "$INSTDIR\KAYRA Tuval.exe"
    CreateShortCut "$DESKTOP\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Tuval.exe" "app=tuval"
    CreateShortCut "$SMPROGRAMS\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Tuval.exe" "app=tuval"
  ${Else}
    Delete "$INSTDIR\KAYRA Tuval.exe"
  ${EndIf}

  ; 6. Creative Hub ana başlatıcı kısayolunu ekle
  CreateShortCut "$DESKTOP\KAYRA Creative Hub.lnk" "$INSTDIR\KAYRA Suite.exe"
  CreateShortCut "$SMPROGRAMS\KAYRA Creative Hub.lnk" "$INSTDIR\KAYRA Suite.exe"
FunctionEnd

!macro customInstall
  Call SetupKayraShortcuts
!macroend

!macro NSIS_HOOK_POSTINSTALL
  Call SetupKayraShortcuts
!macroend

!macro customUnInstall
  Delete "$INSTDIR\kayra-suite.exe"
  Delete "$INSTDIR\KAYRA Suite.exe"
  Delete "$INSTDIR\KAYRA Belge.exe"
  Delete "$INSTDIR\KAYRA Tuval.exe"
  Delete "$DESKTOP\KAYRA Belge.lnk"
  Delete "$SMPROGRAMS\KAYRA Belge.lnk"
  Delete "$DESKTOP\KAYRA Tuval.lnk"
  Delete "$SMPROGRAMS\KAYRA Tuval.lnk"
  Delete "$DESKTOP\KAYRA Creative Hub.lnk"
  Delete "$SMPROGRAMS\KAYRA Creative Hub.lnk"
!macroend
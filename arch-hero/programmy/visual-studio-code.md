# Visual Studio Code

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

```shell
paru -S visual-studio-code-bin
```

Скачайте следующие расширения для VS Code.

* Material Icon Theme
* Catppuccin
* Russian Language Pack For Visual Studio Code

Далее откройте _settings.json_ и вставьте код, который указан ниже.

```json
{
    // Workbench
    "workbench.editor.limit.value": 5,
    "workbench.editor.showTabs": false,
    "workbench.statusBar.visible": false,
    "workbench.editor.showIcons": false,
    "workbench.startupEditor": "none",
    "workbench.iconTheme": "material-icon-theme",
    "workbench.colorTheme": "Catppuccin Mocha",
    // Workbench
    
    // Explorer
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    // Explorer
    
    // Editor
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.indentation": false,
    "editor.renderLineHighlight": "none",
    "editor.lineNumbers": "interval",
    "editor.minimap.enabled": false,
    "editor.overviewRulerBorder": false,
    "editor.acceptSuggestionOnEnter": "off",
    "editor.codeActionsOnSave": {
        "source.fixAll": true
    },
    "editor.foldingImportsByDefault": true,
    "editor.inlineSuggest.enabled": true,
    "editor.linkedEditing": true,
    "editor.quickSuggestions": {
        "other": "off",
        "comments": "off",
        "strings": "off"
    },
    "editor.scrollBeyondLastColumn": 0,
    "editor.unicodeHighlight.nonBasicASCII": false,
    "editor.suggestSelection": "recentlyUsedByPrefix",
    "editor.unicodeHighlight.ambiguousCharacters": false,
    "editor.formatOnSave": true,
    "editor.scrollbar.horizontal": "hidden",
    "editor.scrollbar.vertical": "hidden",
    "editor.tokenColorCustomizations": {
        "textMateRules": [
            {
                "scope": [
                    "comment",
                    "entity.name.type.class",
                    "keyword",
                    "constant",
                    "storage.modifier",
                    "storage.type.class.js"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            },
            {
                "scope": [
                    "invalid",
                    "keyword.operator",
                    "constant.numeric.css",
                    "keyword.other.unit.px.css",
                    "constant.numeric.decimal.js",
                    "constant.numeric.json"
                ],
                "settings": {
                    "fontStyle": ""
                }
            }
        ]
    },
    // Editor
    
    // Font
    "editor.fontSize": 14,
    "editor.fontLigatures": "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'",
    "editor.fontFamily": "JetbrainsMono Nerd Font",
    "editor.fontWeight": "350",
    // Font
    
    // Files
    "files.autoSave": "off",
    "files.defaultLanguage": "markdown",
    // Files
    
    // Terminal
    "terminal.integrated.fontSize": 14,
    // Terminal
    
    // Window
    "window.menuBarVisibility": "toggle",
    "window.zoomLevel": 1,
    // Window
    
    // Other
    "breadcrumbs.enabled": false,
    "security.workspace.trust.untrustedFiles": "open",
    // Other
}
```

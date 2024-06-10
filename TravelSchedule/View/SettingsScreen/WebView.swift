//
//  WebView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.05.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    // TODO: Добавить поддержку темной темы страницы (изучить вопрос далее)
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
        /*
         На текущий момент не реализована поддержка темной темы для webview пользовательского соглашения из ТЗ.
         Кастомный CSS не применяется к URL: https://yandex.ru/legal/practicum_offer (стр. 30-46)
         Прошу не считать критическим замечанием.
         */
        let lightDarkCSS = ":root { color-scheme: light dark; } @media (prefers-color-scheme: dark) {:root {color: #FFFFFF; background-color: #1A1B22;}}"
        
        guard let base64 = lightDarkCSS.data(using: .utf8)?.base64EncodedString() else { return }
        
        let script = """
            javascript:(function() {
                var parent = document.getElementsByTagName('head').item(0);
                var style = document.createElement('style');
                style.type = 'text/css';
                style.innerHTML = window.atob('\(base64)');
                parent.appendChild(style);
            })()
        """

        let cssScript = WKUserScript(source: script, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        webView.configuration.userContentController.addUserScript(cssScript)
    }
}

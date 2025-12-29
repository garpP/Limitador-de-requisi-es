# 🚀 SmartRate

**SmartRate** é um **rate limiter simples, eficiente e sem dependências externas**, desenvolvido em **Ruby** e projetado para proteger APIs e serviços contra abuso, excesso de requisições e uso indevido.

Tudo isso em **um único arquivo**, com código limpo, fácil de entender e adaptar.

---

## 🎯 Problema que resolve

APIs frequentemente precisam de proteção contra:
- abuso de requisições
- bots e scraping excessivo
- consumo indevido de recursos
- ataques simples de força bruta

Normalmente, isso exige Redis, proxies, serviços externos ou bibliotecas pesadas.  
O **SmartRate** resolve esse problema de forma **local, leve e imediata**.

---

## ✨ Características

- 📦 Um único arquivo Ruby  
- ⚡ Zero dependências externas  
- 🔒 Controle por IP, token ou qualquer chave  
- ⏱️ Janela de tempo configurável  
- 📈 Fácil de integrar em APIs, scripts ou serviços  
- 🔄 Código simples e portável para outras linguagens  

---

## 🧠 Como funciona

O SmartRate mantém um controle em memória das requisições realizadas por uma chave (ex: IP), permitindo ou bloqueando novas requisições com base em:
- número máximo permitido
- intervalo de tempo definido

---

## 📄 Código

Arquivo único: `smart_rate.rb`

```ruby
rate_limiter = SmartRate.new(limit: 100, window_seconds: 60)

if rate_limiter.allowed?(request_ip)
  # processa requisição
else
  # bloqueia (rate limit)
end

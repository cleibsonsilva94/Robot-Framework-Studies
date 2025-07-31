# Robot Framework Test Studies - Testes Automatizados

Este repositório contém estudos e práticas com testes automatizados utilizando o **Robot Framework**, uma poderosa ferramenta de automação de testes orientada a palavras-chave. Os testes são escritos em **Python** e fazem uso da **SeleniumLibrary** para automação de aplicações web, com suporte do **WebDriver**.

## 📌 Requisitos

Antes de executar os testes, verifique se os seguintes componentes estão instalados em seu ambiente:

- **Python**: Recomendado a versão 3.8 ou superior  
- **pip**: Gerenciador de pacotes do Python  
- **Google Chrome** ou outro navegador compatível  
- **WebDriver** correspondente ao navegador (ex: ChromeDriver)

## 🚀 Instalação do Ambiente

1. Clone este repositório:  
   ```bash
   git clone git@github.com:seu-usuario/robotframework-test-studies.git
   ```

2. Acesse o diretório do projeto:  
   ```bash
   cd robotframework-test-studies
   ```

3. Crie e ative um ambiente virtual (opcional, mas recomendado):  
   ```bash
   python -m venv venv
   source venv/bin/activate      # Linux/macOS  
   .\venv\Scripts\activate       # Windows
   ```

4. Instale as dependências necessárias:  
   ```bash
   pip install robotframework
   pip install robotframework-seleniumlibrary
   ```

5. Certifique-se de que o **WebDriver** está instalado e disponível no PATH.  
   - [Download do ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)

## 🥾 Execução dos Testes

Para rodar os testes, utilize o seguinte comando na raiz do projeto:

```bash
robot nome-da-pasta-ou-arquivo.robot
```

Exemplo:

```bash
robot tests/
```

## 📂 Estrutura do Projeto

> A estrutura do projeto será definida em breve. Esta seção será atualizada com os diretórios e arquivos criados para os testes.

## 🧪 Aplicação Testada

> [Link para a aplicação que está sendo testada – se aplicável]

## 📚 Referência

Este projeto tem como base os conceitos abordados na [documentação oficial do Robot Framework](https://robotframework.org/), bem como tutoriais e práticas voltadas à automação de testes com Selenium.

---

Sinta-se à vontade para acompanhar os estudos, sugerir melhorias ou contribuir com dicas e boas práticas! 🚀

# 🌍 LibreTranslate Docker Image

## 📖 Overview

This Docker image is based on the official [`libretranslate/libretranslate`](https://hub.docker.com/r/libretranslate/libretranslate) image and includes a caching mechanism for language models. It allows you to run a self-hosted translation service with only the necessary language models, reducing resource consumption.

## ⭐ Features

- **Custom Language Models**: Load only the required languages to save space.
- **Efficient Caching**: Prevent unnecessary downloads and speed up startup.
- **Lightweight & Optimized**: Based on LibreTranslate with pip caching.
- **Fully Customizable**: Modify the `ARG languages` to specify supported languages.

## 🛠 Cloning and Building Locally

### 🔄 Cloning the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/painteau/libretranslate.git
cd libretranslate
```

### 🔨 Building the Custom Image

To create your custom Docker image with preloaded language models, use:

```bash
docker build -t libretranslate-local \
    --build-arg filter=true \
    --build-arg languages="en,fr,ko" .
```

This step compiles the image with only the specified language models, reducing unnecessary storage usage.

### 🚀 Running the Custom Image

Once the image is built, you can start a container with:

```bash
docker run -d --name libretranslate \
    -p 5000:5000 \
    libretranslate-local
```

This will launch the translation service and expose it on port `5000`. Ensure that this port is accessible to your intended users.

## 📦 Running from the Official Image

If you prefer to use the official LibreTranslate image without modifications, you can run it directly with:

```bash
docker run -d --name libretranslate \
    -p 5000:5000 \
    libretranslate/libretranslate:latest
```

This will run the latest official LibreTranslate image with all default language models.

## ⚙ Configuration

- **`filter`**: Set to `true` to limit the downloaded models to only the specified languages.
- **`languages`**: A comma-separated list of language codes (e.g., `en,fr,ko`).

## 📡 API Usage

Once the container is running, you can interact with LibreTranslate's API:

### 🔹 Translate Text

Send a `POST` request to translate a text string:

```bash
curl -X POST "http://localhost:5000/translate" \
     -H "Content-Type: application/json" \
     -d '{"q":"Hello", "source":"en", "target":"fr"}'
```

Response:
```json
{
  "translatedText": "Bonjour"
}
```

### 🔹 Detect Language

Detect the language of a given text:

```bash
curl -X POST "http://localhost:5000/detect" \
     -H "Content-Type: application/json" \
     -d '{"q":"Bonjour"}'
```

Response:
```json
[
  {"language": "fr", "confidence": 0.99}
]
```

### 🔹 List Supported Languages

Retrieve a list of supported languages:

```bash
curl -X GET "http://localhost:5000/languages"
```

Response:
```json
[
  {"code": "en", "name": "English"},
  {"code": "fr", "name": "French"},
  {"code": "ko", "name": "Korean"}
]
```

## ⚠ Security Notice

Ensure that you expose the API securely and restrict access if necessary when deploying in a production environment.

## 📜 License

This project is open-source and licensed under the MIT License.

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository on GitHub: [painteau/libretranslate](https://github.com/painteau/libretranslate).
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your branch and create a pull request.

For major changes, please open an issue first to discuss the proposed modifications.


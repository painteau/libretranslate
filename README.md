# 🌍 LibreTranslate Docker Image

## ⭐ Features

- **Custom Language Models**: Load only the required languages to save space.
- **Efficient Caching**: Prevent unnecessary downloads and speed up startup.
- **Lightweight & Optimized**: Based on LibreTranslate with pip caching.
- **Fully Customizable**: Modify the `ARG languages` to specify supported languages.

## 📌 Prerequisites

- **Docker** installed on your system
- **Git** for cloning the repository

## 🛠 Setup & Installation

### **1️⃣ Clone the Repository**

```bash
git clone https://github.com/painteau/libretranslate.git
cd libretranslate
```

### **2️⃣ Build the Custom Image**

```bash
docker build -t libretranslate-local \
    --build-arg filter=true \
    --build-arg languages="en,fr,ko" .
```

### **3️⃣ Run the Custom Image**

```bash
docker run -d --rm --label com.centurylinklabs.watchtower.enable=true \
    -p 5000:5000 \
    libretranslate-local
```

## 🔨 Running LibreTranslate Locally

### **1️⃣ Pull the Official Docker Image**

```bash
docker pull libretranslate/libretranslate:latest
```

### **2️⃣ Run the Container**

```bash
docker run -d --rm --label com.centurylinklabs.watchtower.enable=true \
    -p 5000:5000 \
    libretranslate/libretranslate:latest
```

## 🐳 Running with Docker (GHCR)

LibreTranslate is available on **GitHub Container Registry (GHCR)**.

## ⚙ Configuration

| Option        | Description                                                |
|--------------|------------------------------------------------------------|
| `filter`      | Set to `true` to limit the downloaded models to only the specified languages. |
| `languages`   | A comma-separated list of language codes (e.g., `en,fr,ko`). |

## 📡 API Usage

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

## 🔧 Troubleshooting

- **Ensure Docker is installed and running correctly.**
- **Check container logs for errors using:**
  ```bash
  docker logs libretranslate
  ```
- **If API requests fail, verify that port 5000 is accessible.**

## 📜 License

This project is licensed under the **MIT License**.

## ⚠ Security Notice

Ensure that you expose the API securely and restrict access if necessary when deploying in a production environment.

## 💡 Contributing

1️⃣ **Fork** the repository on [GitHub](https://github.com/painteau/libretranslate)  
2️⃣ **Create a new branch** (`feature-branch`)  
3️⃣ **Commit your changes**  
4️⃣ **Push to your branch and create a pull request**  

For major changes, please open an **issue** first to discuss the proposed modifications.


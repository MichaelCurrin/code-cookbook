# Django

## Load settings from env variables

To update Django settings using environment variables, you should use a dedicated parsing library. Relying on `os.environ` directly is often insufficient because environment variables are always strings, which leads to manual type conversion for booleans, integers, and lists.

The following methods are the standard approaches for implementing environment-based configuration.

### Pydantic Settings
Using `pydantic-settings` provides strict validation. It ensures that the application does not start if an environment variable is missing or contains an incompatible data type.

### Implementation
1. **Define the Schema**: Create a configuration class to define your expected variables and their types.
2. **Load Configuration**: Reference this class within your Django settings.

```python
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    SECRET_KEY: str
    DEBUG: bool = False
    ALLOWED_HOSTS: list[str] = []

    model_config = SettingsConfigDict(env_file=".env")

# Instantiate and use in settings.py
config = Settings()
SECRET_KEY = config.SECRET_KEY
DEBUG = config.DEBUG
```

---

## Django-Environ
This library is specifically designed for Django. It includes a parser for Database URLs, which converts a single connection string into the dictionary format required by Django's `DATABASES` setting.

### Implementation
```python
import environ
import os

env = environ.Env(
    DEBUG=(bool, False)
)

# Load the .env file
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

# Assignment
SECRET_KEY = env('SECRET_KEY')
DEBUG = env('DEBUG')
DATABASES = {
    'default': env.db('DATABASE_URL')
}
```

---

### Python-Decouple
`python-decouple` provides a simple interface for separating configuration parameters from source code. It handles basic type casting and allows for default values.

### Implementation
```python
from decouple import config, Csv

SECRET_KEY = config('SECRET_KEY')
DEBUG = config('DEBUG', default=False, cast=bool)
ALLOWED_HOSTS = config('ALLOWED_HOSTS', cast=Csv())
```

---

### Technical Comparison

| Feature | python-decouple | django-environ | pydantic-settings |
| :--- | :--- | :--- | :--- |
| **Primary Use** | Simple casting | Django-specific utilities | Type validation |
| **URL Parsing** | No | Yes (DB, Cache, Email) | No |
| **Validation** | Basic | Basic | Comprehensive |

#### Implementation Requirements
* **Exclude Environment Files**: Ensure `.env` is added to your version control exclusion list (e.g. `.gitignore`).
* **Documentation**: Maintain a template file, such as `.env.example`, containing the necessary keys without sensitive data to inform other contributors of the required environment configuration.
* **Initialization**: Ensure the environment is loaded at the beginning of the settings module to prevent `NameError` exceptions during the configuration of dependent components.


# Requests with retry

```python
from urllib3.util.retry import Retry

import requests
from requests.adapters import HTTPAdapter


def requests_retry_session(
    retries: int = 3,
    backoff_factor: float = 0.3,
    status_forcelist: tuple = (500, 502, 503, 504),
    session: requests.Session | None = None,
) -> requests.Session:
    """
    Return a requests.Session object with a retry strategy.

    Args:
        retries: Number of retries to attempt.
        backoff_factor: A backoff factor to apply between attempts.
        status_forcelist: A set of HTTP status codes that we should retry on.
        session: An optional existing session object to mount the adapter on.

    Returns:
        requests.Session: A session object configured for retries.
    """
    session = session or requests.Session()

    retry = Retry(
        total=retries,
        read=retries,
        connect=retries,
        backoff_factor=backoff_factor,
        status_forcelist=status_forcelist,
    )
    adapter = HTTPAdapter(max_retries=retry)
    session.mount("http://", adapter)
    session.mount("https://", adapter)

    return session


# Example usage
try:
    s = requests_retry_session()
    response = s.get("http://httpbin.org/status/500")
    response.raise_for_status()
    print("Success!")
except requests.exceptions.RequestException as e:
    print(f"Failed after retries: {e}")
```

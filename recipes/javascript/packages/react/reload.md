# Reload

```jsx
function refreshPage() {
  window.location.reload(false);
}

function App() { 
  return (
    <div>
      <button onClick={refreshPage}>Click to reload!</button>
    </div>
  );
}

export default App
```

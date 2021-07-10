# JSON

## Convert to JSON

### Basic

```go
// printJSON will accept generic response, convert to JSON and print it.
func printJSON(resp interface{}) {
	json, err := json.Marshal(resp)
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Printf("%s\n", string(json))
}
```

### Indent

Based on [main.go](https://github.com/shurcooL/githubv4/blob/master/example/githubv4dev/main.go) in `githubv4` example section.

```go
// printJSON prints v as JSON encoded with indent to stdout. It panics on any error.
func priprintJSONntAsJSON(v interface{}) {
	w := json.NewEncoder(os.Stdout)
	w.SetIndent("", "\t")
	
	err := w.Encode(v)
	if err != nil {
		panic(err)
	}
}
```

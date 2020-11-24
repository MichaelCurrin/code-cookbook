# CSV


## Samples

### Read and write CSV

Based on [CSV Data Manipulation](https://rosettacode.org/wiki/CSV_data_manipulation#Go) on Rosetta Code.

This may not be efficient (the for loop and appending looks messy) but it works.

- `main.go`
    ```go
    package main

    import (
      "encoding/csv"
      "log"
      "os"
      "strconv"
    )
    
    func sum(row []string) string {
      sum := 0
      for _, s := range row {
        x, err := strconv.Atoi(s)
        if err != nil {
          return "NA"
        }
        sum += x
      }
      return strconv.Itoa(sum)
    }
    
    func appendSum(rows [][]string) {
      rows[0] = append(rows[0], "SUM")
      for i := 1; i < len(rows); i++ {
        rows[i] = append(rows[i], sum(rows[i]))
      }
    }

    func read(path string) [][]string {
      f, err := os.Open(path)
      if err != nil {
        log.Fatal(err)
      }
      rows, err := csv.NewReader(f).ReadAll()
      f.Close()
      if err != nil {
        log.Fatal(err)
      }
      return rows
    }

    func write(path string, rows [][]string) {
      f, err := os.Create(path)
      if err != nil {
        log.Fatal(err)
      }
      err = csv.NewWriter(f).WriteAll(rows)
      f.Close()
      if err != nil {
        log.Fatal(err)
      }
    }
    
    func main() {
      rows := read("sample.csv")
      appendSum(rows)
      write("output.csv", rows)
    }
    ```
- `input.csv`
    ```
    C1,C2,C3,C4,C5
    1,5,9,13,17
    2,six,10,14,18
    3,7,11,15,19
    4,8,12,16,20
    ```
- `output.csv`
    ```
    C1,C2,C3,C4,C5,SUM
    1,5,9,13,17,45
    2,six,10,14,18,NA
    3,7,11,15,19,55
    4,8,12,16,20,60
    ```

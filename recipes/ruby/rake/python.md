# Python project

I'd rather use `make` for Python, as it is not specific to Ruby and would make more sense to me. But anyway here is a `Rakefile` from a Python project I found and I wanted to save it as a reference.

- `Rakefile`
    ```ruby
    task :clean => [:clean_pyc, :clean_build, :clean_dist]

    task :clean_pyc do
      sh "find . -name '*.pyc' -exec rm {} \\;"
    end

    task :clean_build do
      sh "rm -rf build/*"
    end

    task :clean_dist do
      sh "rm -f dist/*.egg"
    end

    task :doc do
      sh "python setup.py build_sphinx"
    end

    task :release do
      sh "python setup.py sdist bdist_wheel --universal upload"
    end
    ```

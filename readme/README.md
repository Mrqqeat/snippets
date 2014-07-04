# Readme
## Summary
This tiny Ruby script simply extracts the header information from SES scripts and generates an appropriate README.md file from the extracted information. Considering the format of SES scripts, the README.md file is placed in the directory directly _below_ the directory where the source file is located.

## Usage
For example, let's generate a new README.md file for the SES Console:

```sh
$ ruby readme.rb sesvxace/console/lib/console.rb
```

This will generate a README.md file from the header information in the sesvxace/console/lib/console.rb file (everything between `#--` and `#++`) and place the README.md file in the sesvxace/console directory.
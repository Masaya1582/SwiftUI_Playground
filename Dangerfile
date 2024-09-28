# Access pull request information
message = "Thanks for your pull request!"
warn(message)

# Fail the build if certain conditions are met
if git.modified_files.include? "config.yml"
  fail("Please be careful when modifying config.yml.")
end

# Warn if there are too many changes in a single PR
if git.lines_of_code > 500
  warn("Big PR! Consider splitting this into smaller chunks.")
end

# SwiftLint check
swiftlint.lint_files inline_mode: true


# Print a message at the end of the Dangerfile
message("Code checks have been completed.")